import XCTest
@testable import SwiftScope

final class TeslapediaTests: ApiTestCase {
    
    func testSoftwareVersions() async throws {
        self.setupStub(responseFile: "SoftwareVersions.json", uri: "/api/software")
                
        let service = Teslapedia()
        let softwareVersions = try await service.getSoftwareVersions()
        
        XCTAssertEqual(539, softwareVersions.count)
        XCTAssertEqual("2023.6.9", softwareVersions[0])
    }
    
    func testSoftwareVersion() async throws {
        self.setupStub(responseFile: "SoftwareVersion.json", uri: "/api/software/2023.6.9")
                
        let service = Teslapedia()
        let softwareVersion = try await service.getSoftwareVersion(version: "2023.6.9")
        
        XCTAssertEqual("2023.6.9", softwareVersion.version)
        XCTAssertEqual(196, softwareVersion.count)
        XCTAssertEqual(32, softwareVersion.countries[1].count)
    }
}
