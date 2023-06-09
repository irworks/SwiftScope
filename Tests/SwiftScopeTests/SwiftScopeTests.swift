import XCTest
@testable import SwiftScope

final class SwiftScopeTests: ApiTestCase {
    
    func testGetBasiceVehicle() async throws {
        self.setupStub(responseFile: "BasicVehicle.json", uri: "/api/vehicle/corsair")
                
        let service = SwiftScope()
        let vehicle: BasicVehicle = try await service.getBasicVehicle(vehicleId: "corsair")
        
        XCTAssertEqual("Testulus", vehicle.name)
        XCTAssertEqual("corsair", vehicle.publicId)
        XCTAssertEqual(85808.62, vehicle.odometer)
        
        XCTAssertEqual(33, vehicle.battery.level)
        XCTAssertEqual("90.65", vehicle.battery.range)
    }
    
    func testGetVehicleState() async throws {
        self.setupStub(responseFile: "VehicleState.json", uri: "/api/vehicle/corsair/state")
                
        let service = SwiftScope()
        let state = try await service.getVehicleState(vehicleId: "corsair")
        
        XCTAssertEqual("asleep", state)
    }
    
    
    func testGetBasiceVehicleWithAuth() async throws {
        self.setupStub(responseFile: "BasicVehicleAuthenticated.json", uri: "/api/vehicle/corsair")
                
        let service = SwiftScope()
        let vehicle: BasicVehicle = try await service.getBasicVehicle(vehicleId: "corsair")
        
        XCTAssertEqual("Testulus Auth", vehicle.name)
        XCTAssertEqual("corsair", vehicle.publicId)
        XCTAssertEqual(29642.56, vehicle.odometer)
        
        XCTAssertEqual(42, vehicle.battery.level)
        XCTAssertEqual("122.62", vehicle.battery.range)
        XCTAssertEqual(81, vehicle.battery.chargeLimitSoC!)
        XCTAssertEqual(false, vehicle.climate.isRearDefrosterOn!)
        XCTAssertEqual(true, vehicle.climate.isFrontDefrosterOn!)
        
        XCTAssertEqual(false, vehicle.vehicle?.isUserPresent)
        XCTAssertEqual("Red", vehicle.vehicle?.config?.color!)
        XCTAssertEqual("Red Multicoat", vehicle.vehicle?.config?.colorName!)
    }

    func testGetDrivingSessions() async throws {
        self.setupStub(responseFile: "DrivingSessions.json", uri: "/api/vehicle/corsair/drives")

        let service = SwiftScope()
        let drives: PaginatedJsonResponse<DrivingSession> = try await service.getDrivingSessions(vehicleId: "corsair")
        
        XCTAssertEqual(30, drives.currentPage)
        XCTAssertEqual(31, drives.nextPage)
        XCTAssertEqual(29, drives.prevPage)
        
        XCTAssertEqual(43074, drives.data[0].id)
        XCTAssertEqual("personal", drives.data[0].type)
    }
    
    func testGetDrivingSession() async throws {
        self.setupStub(responseFile: "DrivingSession.json", uri: "/api/vehicle/corsair/drive/3685708")
                
        let service = SwiftScope()
        let drive: DrivingSession = try await service.getDrivingSession(vehicleId: "corsair", driveId: 3685708)
        
        XCTAssertNil(drive.name)
        XCTAssertNil(drive.description)
        XCTAssertEqual("3.390000", drive.distance)
        XCTAssertEqual(1140, drive.duration)
        XCTAssertEqual("D", drive.progress![0].shiftState)
    }
    
    func testGetChargingSessions() async throws {
        self.setupStub(responseFile: "ChargingSessions.json", uri: "/api/vehicle/corsair/charges")

        let service = SwiftScope()
        let charges: PaginatedJsonResponse<ChargingSession> = try await service.getChargingSessions(vehicleId: "corsair")
        
        XCTAssertEqual(20, charges.currentPage)
        XCTAssertEqual(21, charges.nextPage)
        XCTAssertEqual(19, charges.prevPage)
        
        XCTAssertEqual(411153, charges.data[0].id)
        XCTAssertEqual(1012, charges.data[0].duration)
    }
    
    func testGetChargingSession() async throws {
        self.setupStub(responseFile: "ChargingSession.json", uri: "/api/vehicle/corsair/charge/411153")
                
        let service = SwiftScope()
        let charge: ChargingSession = try await service.getChargingSession(vehicleId: "corsair", chargeId: 411153)
        
        XCTAssertNil(charge.name)
        XCTAssertEqual(49, charge.batteryLevelStart)
        XCTAssertEqual(73, charge.batteryLevelEnd)
        XCTAssertEqual("17.69", charge.chargeEnergyCalculated)
    }
}
