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
let service = SwiftScope()
let vehicle: BasicVehicle = try await service.getBasicVehicle(vehicleId: "corsair")
```
