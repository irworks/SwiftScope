# SwiftScope

A Swift implementation of the [TESLASCOPE API](https://teslascope.com/developers/documentation) for usage on Apple platforms.

This library is built using `async` `await` syntax.

## Examples

## Setup
```swift
// init the vehicle api
let swiftScope = SwiftScope()
swiftScope.setApiKey("yourapikey")

// init (if needed) the teslapedia api (software versions)
let teslapedia = Teslapedia() 
```

## Usage
### Vehicle API
Get details about a vehicle and it's driving/charging sessions.

#### Fetch a vehicle
```swift
let vehicle: BasicVehicle = try await swiftScope.getBasicVehicle(vehicleId: "corsair")
```

#### Fetch vehicle state (`offline`, `online`, `asleep`)
```swift
let state = try await swiftScope.getBasicVehicleState(vehicleId: "corsair")
```

#### Fetch driving/charging sessions
This data is paginated, after requesting without parameters you can retrieve the `nextPage` and `prevPage` properties.
```swift
let drives: PaginatedJsonResponse<DrivingSession> = try await swiftScope.getDrivingSessions(vehicleId: "corsair")

let charges: PaginatedJsonResponse<ChargingSession> = try await swiftScope.getChargingSessions(vehicleId: "corsair")

print(drives.currentPage) // will print the current page index
print(drives.nextPage) // will print the next page index
print(drives.prevPage) // will print the previous page index

// request the next page
let moreDrives: PaginatedJsonResponse<DrivingSession> = try await swiftScope.getDrivingSessions(vehicleId: "corsair", page: drives.nextPage)
```

### Teslapedia API
Get a list of known software updates and their feature lists.

#### Fetch a list of software versions
```swift
let softwareVersions: [String] = try await teslapedia.getSoftwareVersions()
```
