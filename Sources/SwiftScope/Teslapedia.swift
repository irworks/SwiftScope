//
//  Teslapedia.swift
//  
//
//  Created by Ilja Rozhko on 30.03.23.
//

import Foundation

public struct Teslapedia {
    private let apiService: ApiService

    public init() {
        self.apiService = ApiService()
    }
    
    /**
    Gets a list of all known software versions.
    - returns: [String]
    */
    public func getSoftwareVersions() async throws -> [String] {
        let endpoint = "/software"
        let response: JsonResponseArray<String> = try await self.apiService.performRequest(endpoint)
        
        return response.response
    }
    
    /**
    Gets a details about a specific software version
    - returns: SoftwareVersion
    */
    public func getSoftwareVersion(version: String) async throws -> SoftwareVersion {
        let endpoint = "/software/\(version)"
        let response: JsonResponse<SoftwareVersion> = try await self.apiService.performRequest(endpoint)
        
        return response.response
    }
}
