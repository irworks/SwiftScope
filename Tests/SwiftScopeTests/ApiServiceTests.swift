//
//  ApiServiceTests.swift
//  
//
//  Created by Ilja Rozhko on 01.04.23.
//

import XCTest
@testable import SwiftScope

final class ApiServiceTests: XCTestCase {

    func testBuildUrl() throws {
        let apiService = ApiService()
        
        XCTAssertEqual("https://teslascope.com/api/vehicle", apiService.buildUrl(endpoint: "/vehicle").absoluteString)
        
        XCTAssertEqual("https://teslascope.com/api/vehicle/sub/path/and/one/more?param=123", apiService.buildUrl(endpoint: "/vehicle/sub/path/and/one/more?param=123").absoluteString)
        
        apiService.apiKey = "tester123"
        
        XCTAssertEqual("https://teslascope.com/api/vehicle/sub/path/and/one/more?param=123&api_key=tester123", apiService.buildUrl(endpoint: "/vehicle/sub/path/and/one/more", parameters: [URLQueryItem(name: "param", value: "123")]).absoluteString)
    }
}
