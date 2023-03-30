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
}
