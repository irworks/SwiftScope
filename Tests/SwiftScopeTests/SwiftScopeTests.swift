import XCTest
@testable import SwiftScope
import OHHTTPStubs
import OHHTTPStubsSwift

final class SwiftScopeTests: XCTestCase {
    private let headers = ["Content-Type": "application/json"]
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftScope().text, "Hello, World!")
    }
    
    func testGetBasiceVehicle() async throws {
        let path = OHPathForFileInBundle("BasicVehicle.json", Bundle.module)
        
        _ = stub(condition: isPath("/api/vehicle/corsair")) {
            _ in
            return fixture(filePath: path!, headers: self.headers)
        }
                
        let service = SwiftScope()
        let vehicle: BasicVehicle = try await service.getBasicVehicle(vehicleId: "corsair")
        
        XCTAssertEqual("Testulus", vehicle.name)
        XCTAssertEqual("corsair", vehicle.publicId)
        XCTAssertEqual(85808.62, vehicle.odometer)
    }
}
