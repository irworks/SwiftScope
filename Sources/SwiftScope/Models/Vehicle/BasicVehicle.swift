//
//  BasicVehicle.swift
//  
//
//  Created by Ilja Rozhko on 28.03.23.
//

import Foundation

public struct BasicVehicle: Codable {
    public var name: String
    public var publicId: String
    public var odometer: Double
    public var model: String
    public var year: String?
    public var trim: String?
    public var carVersion: String
    public var battery: VehicleBattery
    public var climate: VehicleClimate
    public var statistics: VehicleStatistics
    public var vehicle: Vehicle?
    
    public var renderUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case publicId = "public_id"
        case odometer
        case model
        case year
        case trim
        case carVersion = "car_version"
        case battery
        case climate
        case statistics
        case vehicle
        case renderUrl = "render_url"
    }
}

public struct VehicleBattery: Codable {
    public var level: Int
    public var range: String
    public var chargeLimitSoC: Int?
    public var chargingState: String?
    public var timeRemaining: String?
    public var scheduledChargingPending: Bool?
    public var scheduledChargingStartTime: String?
    
    enum CodingKeys: String, CodingKey {
        case level
        case range
        case chargeLimitSoC = "charge_limit_soc"
        case chargingState = "charging_state"
        case timeRemaining = "time_remaining"
        case scheduledChargingPending = "scheduled_charging_pending"
        case scheduledChargingStartTime = "scheduled_charging_start_time"
    }
}

public struct VehicleClimate: Codable {
    public var inside: Double
    public var outside: Double
    public var isAutoConditioningOn: Bool?
    public var isClimateOn: Bool?
    public var isFrontDefrosterOn: Bool?
    public var isRearDefrosterOn: Bool?
    public var seatHeaters: VehicleSeatHeaters?
    
    enum CodingKeys: String, CodingKey {
        case inside
        case outside
        case isAutoConditioningOn = "is_auto_conditioning_on"
        case isClimateOn = "is_climate_on"
        case isFrontDefrosterOn = "is_front_defroster_on"
        case isRearDefrosterOn = "is_rear_defroster_on"
        case seatHeaters = "seat_heaters"
    }
}

public struct VehicleSeatHeaters: Codable {
    public var left: Int
    public var right: Int
    public var leftRear: Int
    public var centerRear: Int
    public var rightRear: Int
    
    enum CodingKeys: String, CodingKey {
        case left
        case right
        case leftRear = "left_rear"
        case centerRear = "center_rear"
        case rightRear = "right_rear"
    }
}

public struct VehicleStatistics: Codable {
    public var drives: Int
    public var distance: Double
    public var drivesDuration: Int
    public var charges: Int
    public var supercharging: Int
    public var chargesDuration: Int
    public var chargesKwh: Double
    public var joined: String
    public var hw: String
    
    enum CodingKeys: String, CodingKey {
        case drives
        case distance
        case drivesDuration = "drives_duration"
        case charges
        case supercharging
        case chargesDuration = "charges_duration"
        case chargesKwh = "charges_kwh"
        case joined
        case hw
    }
}

public struct Vehicle : Codable {
    public let locked : Bool
    public let sentryMode : Bool?
    public let latitude : String?
    public let longitude : String?
    public let isUserPresent : Bool
    public let windows : VehicleWindows?
    public let config : VehicleConfig?

    enum CodingKeys: String, CodingKey {
        case locked
        case sentryMode = "sentry_mode"
        case latitude
        case longitude
        case isUserPresent = "is_user_present"
        case windows
        case config
    }
}

public struct VehicleWindows : Codable {
    public let driverFront : Bool?
    public let driverRear : Bool?
    public let passengerFront : Bool?
    public let passengerRear : Bool?

    enum CodingKeys: String, CodingKey {
        case driverFront = "driver_front"
        case driverRear = "driver_rear"
        case passengerFront = "passenger_front"
        case passengerRear = "passenger_rear"
    }
}

public struct VehicleConfig : Codable {
    public let color : String?
    public let colorName : String?
    public let wheels : String?
    public let spoiler : String?
    public let roofColor : String?

    enum CodingKeys: String, CodingKey {
        case color
        case colorName = "color_name"
        case wheels
        case spoiler
        case roofColor = "roof_color"
    }
}
