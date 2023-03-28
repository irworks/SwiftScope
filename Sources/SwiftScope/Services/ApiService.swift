//
//  ApiService.swift
//  
//
//  Created by Ilja Rozhko on 28.03.23.
//

import Foundation

class ApiService {
    private let decoder = JSONDecoder()
    
    init() {
        // self.decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
    }

    public enum SwiftScopeError: Error, Equatable {
        case networkError(error: NSError)
        case authenticationRequired
        case authenticationFailed
        case tokenRevoked
        case noTokenToRefresh
        case tokenRefreshFailed
        case invalidOptionsForCommand
        case failedToParseData
        case failedToReloadVehicle
        case internalError
    }
    
    func buildRequest(endpoint: String, method: String = "GET", parameters: Any? = nil) -> URLRequest {
        var request = URLRequest(url: URL(string: "\(ApiConfiguration.BaseUrl)\(endpoint)")!)
        request.httpMethod = method
        
        if let parameters = parameters {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .fragmentsAllowed)
            } catch let error {
                print(error.localizedDescription)
            }
        }
                
        // set json as content type for requests & responses
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        // add auth token
        /*if let apiToken = self.keychainService.apiToken {
            request.setValue("Bearer \(apiToken)", forHTTPHeaderField: "Authorization")
        }*/
        
        return request
    }
    
    @available(macOS 10.15, *)
    func performRequest<ReturnType: Decodable>(
        _ endpoint: String
    ) async throws -> ReturnType {
        let request = self.buildRequest(endpoint: endpoint)

        let data: Data
        let response: URLResponse

        if #available(macOS 12.0, *) {
            (data, response) = try await URLSession.shared.data(for: request)
        } else {
            (data, response) = try await withCheckedThrowingContinuation { continuation in
                URLSession.shared.dataTask(with: request) { data, response, error in
                    if let data = data, let response = response {
                        continuation.resume(with: .success((data, response)))
                    } else {
                        continuation.resume(with: .failure(error ?? SwiftScopeError.internalError))
                    }
                }.resume()
            }
        }

        guard let httpResponse = response as? HTTPURLResponse else { throw SwiftScopeError.failedToParseData }

        var responseString = "\nRESPONSE: \(String(describing: httpResponse.url))"
        responseString += "\nSTATUS CODE: \(httpResponse.statusCode)"
        if let headers = httpResponse.allHeaderFields as? [String: String] {
            responseString += "\nHEADERS: [\n"
            headers.forEach {(key: String, value: String) in
                responseString += "\"\(key)\": \"\(value)\"\n"
            }
            responseString += "]"
        }

        print(responseString)

        if case 200..<300 = httpResponse.statusCode {
            do {
                let objectString = String.init(data: data, encoding: String.Encoding.utf8) ?? "No Body"
                print("RESPONSE BODY: \(objectString)\n")

                let mapped = try self.decoder.decode(ReturnType.self, from: data)
                return mapped
            } catch {
                print("ERROR: \(error)")
                throw SwiftScopeError.failedToParseData
            }
        } else {
            let objectString = String.init(data: data, encoding: String.Encoding.utf8) ?? "No Body"
            print("RESPONSE BODY ERROR: \(objectString)\n")
            if let wwwAuthenticate = httpResponse.allHeaderFields["Www-Authenticate"] as? String,
               wwwAuthenticate.contains("invalid_token") {
                throw SwiftScopeError.tokenRevoked
            } else if httpResponse.allHeaderFields["Www-Authenticate"] != nil, httpResponse.statusCode == 401 {
                throw SwiftScopeError.authenticationFailed
            } else {
                throw SwiftScopeError.networkError(error: NSError(domain: "SwiftScopeError", code: httpResponse.statusCode, userInfo: nil))
            }
        }
    }
}
