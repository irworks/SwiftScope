import Foundation

public struct SwiftScope {
    public enum SwiftScopeError: Error, Equatable {
        case noVehicleSelected
    }
    
    // you can define the current vehicle in order to simplify calls
    public var currentVehicle: BasicVehicle?
    
    private let apiService: ApiService

    public init() {
        self.apiService = ApiService()
    }
    
    public func setApiKey(apiKey: String?) {
        self.apiService.apiKey = apiKey
    }
    
    /**
    Fetchs the basic summary of a vehicle (available for public vehicles as well)
    - returns: BasicVehicle.
    */
    public func getBasicVehicle(vehicleId: String) async throws -> BasicVehicle {
        let endpoint = "/vehicle/\(vehicleId)"
        let response: JsonResponse<BasicVehicle> = try await self.apiService.performRequest(endpoint)
        
        return response.response
    }
    
    /**
    Fetchs the basic summary of a vehicle (available for public vehicles as well)
    - returns: BasicVehicle.
    */
    public func getVehicleState(vehicleId: String) async throws -> String {
        let endpoint = "/vehicle/\(vehicleId)/state"
        let response: JsonResponse<String> = try await self.apiService.performRequest(endpoint)
        
        return response.response
    }
    
    /**
    Fetchs a paginated list of driving sessions
    - returns: PaginatedJsonResponse of DrivingSessions.
    */
    public func getDrivingSessions(vehicleId: String, page: Int? = nil) async throws -> PaginatedJsonResponse<DrivingSession> {
        var parameters: [URLQueryItem]? = nil
        if let page = page {
            parameters = [URLQueryItem(name: "page", value: "\(page)")]
        }
        let endpoint = "/vehicle/\(vehicleId)/drives"
        
        let response: JsonResponse<PaginatedJsonResponse<DrivingSession>> = try await self.apiService.performRequest(endpoint, method: "GET", parameters: parameters)
                                    
        return response.response
    }
    
    /**
    Fetchs details about a specific driving session
    - returns: DrivingSession.
    */
    public func getDrivingSession(vehicleId: String, driveId: Int) async throws -> DrivingSession {
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
    
    /**
    Fetchs a paginated list of charging sessions
    - returns: PaginatedJsonResponse of ChargingSessions.
    */
    public func getChargingSessions(vehicleId: String, page: Int? = nil) async throws -> PaginatedJsonResponse<ChargingSession> {
        var parameters: [URLQueryItem]? = nil
        if let page = page {
            parameters = [URLQueryItem(name: "page", value: "\(page)")]
        }
        let endpoint = "/vehicle/\(vehicleId)/charges"
        
        let response: JsonResponse<PaginatedJsonResponse<ChargingSession>> = try await self.apiService.performRequest(endpoint, method: "GET", parameters: parameters)
                                    
        return response.response
    }
    
    /**
    Fetchs details about a specific charging session
    - returns: ChargingSession.
    */
    public func getChargingSession(vehicleId: String, chargeId: Int) async throws -> ChargingSession {
        let endpoint = "/vehicle/\(vehicleId)/charge/\(chargeId)"
        let response: JsonResponse<ChargingSession> = try await self.apiService.performRequest(endpoint)
        
        return response.response
    }
    
    /**
    Fetchs details about a specific charging session
    - returns: ChargingSession.
    */
    public func getChargingSession(chargeId: Int) async throws -> ChargingSession {
        guard let vehicleId = self.currentVehicle?.publicId else {throw SwiftScopeError.noVehicleSelected}
        
        return try await self.getChargingSession(vehicleId: vehicleId, chargeId: chargeId)
    }
}
