import Foundation

public struct SwiftScope {
    public private(set) var text = "Hello, World!"
    public enum SwiftScopeError: Error, Equatable {
        case noVehicleSelected
    }
    
    // you can define the current vehicle in order to simplify calls
    public var currentVehicle: BasicVehicle?
    
    private let apiService: ApiService

    public init() {
        self.apiService = ApiService()
    }
    
    /**
    Fetchs the basic summary of a vehicle (available for public vehicles as well)
    - returns: BasicVehicle.
    */
    public func getBasicVehicle(vehicleId: String) async throws -> BasicVehicle {
        // _ = try await checkAuthentication()
        let endpoint = "/vehicle/\(vehicleId)"
        let response: JsonResponse<BasicVehicle> = try await self.apiService.performRequest(endpoint)
        
        return response.response
    }
    
    /**
    Fetchs details about a specific driving session
    - returns: DrivingSession.
    */
    public func getDrivingSession(vehicleId: String, driveId: Int) async throws -> DrivingSession {
        // _ = try await checkAuthentication()
        let endpoint = "/vehicle/\(vehicleId)/drive/\(driveId)"
        let response: JsonResponse<DrivingSession> = try await self.apiService.performRequest(endpoint)
        
        return response.response
    }
    
    /**
    Fetchs details about a specific driving session
    - returns: DrivingSession.
    */
    public func getDrivingSession(driveId: Int) async throws -> DrivingSession {
        guard let vehicleId = self.currentVehicle?.publicId else {throw SwiftScopeError.noVehicleSelected}
        
        return try await self.getDrivingSession(vehicleId: vehicleId, driveId: driveId)
    }
}
