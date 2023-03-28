@available(macOS 10.15, *)
public struct SwiftScope {
    public private(set) var text = "Hello, World!"
    
    private let apiService: ApiService

    public init() {
        self.apiService = ApiService()
    }
    
    /**
    Fetchs the summary of a vehicle
    - returns: A Vehicle.
    */
    public func getBasicVehicle(vehicleId: String) async throws -> BasicVehicle {
        // _ = try await checkAuthentication()
        let endpoint = "/vehicle/\(vehicleId)"
        let response: JsonResponse<BasicVehicle> = try await self.apiService.performRequest(endpoint)
        
        return response.response
    }
    
}
