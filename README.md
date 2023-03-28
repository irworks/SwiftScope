# SwiftScope

A Swift implementation of the [TESLASCOPE API](https://teslascope.com/developers/documentation) for usage on Apple platforms.

This library is built using `async` `await` syntax.

## Examples

## Setup
```swift
// init the api
let swiftScope = SwiftScope()
swiftScope.setApiKey("yourapikey")
```

### Fetch your vehicle
```swift
let vehicle: BasicVehicle = try await swiftScope.getBasicVehicle(vehicleId: "corsair")
```

### Fetch driving sessions
This data is paginated, after requesting without parameters you can retrieve the `nextPage` and `prevPage` properties.
```swift
let drives: PaginatedJsonResponse<DrivingSession> = try await swiftScope.getDrivingSessions(vehicleId: "corsair")

print(drives.currentPage) // will print the current page index
print(drives.nextPage) // will print the next page index
print(drives.prevPage) // will print the previous page index

// request the next page
let moreDrives: PaginatedJsonResponse<DrivingSession> = try await swiftScope.getDrivingSessions(vehicleId: "corsair", page: drives.nextPage)
```
