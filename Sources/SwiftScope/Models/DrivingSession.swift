//
//  DrivingSession.swift
//  
//
//  Created by Ilja Rozhko on 28.03.23.
//

import Foundation

public struct DrivingSession: Codable {
    public var id                : Int
    public var vehicleId         : Int
    public var name              : String?
    public var description       : String?
    public var distance          : String
    public var duration          : Int
    public var avgSpeed          : Int
    public var efficiency        : Int?
    public var batteryLevelStart : Int
    public var batteryRangeStart : String
    public var batteryLevelEnd   : Int
    public var batteryRangeEnd   : String
    public var latitudeStart     : String
    public var longitudeStart    : String
    public var latitudeEnd       : String
    public var longitudeEnd      : String
    public var isPrivate         : Int
    public var type              : String
    public var valet             : Int
    public var hideSpeeding      : Int
    public var importId          : String?
    public var createdAt         : String
    public var updatedAt         : String
    public var progress          : [DriveProgress]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case vehicleId         = "vehicle_id"
        case name
        case description
        case distance
        case duration
        case avgSpeed          = "avg_speed"
        case efficiency
        case batteryLevelStart = "battery_level_start"
        case batteryRangeStart = "battery_range_start"
        case batteryLevelEnd   = "battery_level_end"
        case batteryRangeEnd   = "battery_range_end"
        case latitudeStart     = "latitude_start"
        case longitudeStart    = "longitude_start"
        case latitudeEnd       = "latitude_end"
        case longitudeEnd      = "longitude_end"
        case isPrivate         = "private"
        case type
        case valet
        case hideSpeeding      = "hide_speeding"
        case importId          = "import_id"
        case createdAt         = "created_at"
        case updatedAt         = "updated_at"
        case progress
    }
}

public struct DriveProgress: Codable {
    public var id                   : Int
    public var heading              : Int
    public var latitude             : String
    public var longitude            : String
    public var odometer             : String
    public var shiftState           : String?
    public var power                : Int?
    public var speed                : Int?
    public var batteryLevel         : Int
    public var usableBatteryLevel   : Int
    public var batteryRange         : String
    public var estBatteryRange      : String
    public var fanStatus            : String
    public var insideTemp           : String
    public var outsideTemp          : String
    public var isAutoConditioningOn : Int
    public var isClimateOn          : Int
    public var isImported           : Int
    public var createdAt            : String
    public var updatedAt            : String
    
    enum CodingKeys: String, CodingKey {
        case id                   = "id"
        case heading              = "heading"
        case latitude             = "latitude"
        case longitude            = "longitude"
        case odometer             = "odometer"
        case shiftState           = "shift_state"
        case power                = "power"
        case speed                = "speed"
        case batteryLevel         = "battery_level"
        case usableBatteryLevel   = "usable_battery_level"
        case batteryRange         = "battery_range"
        case estBatteryRange      = "est_battery_range"
        case fanStatus            = "fan_status"
        case insideTemp           = "inside_temp"
        case outsideTemp          = "outside_temp"
        case isAutoConditioningOn = "is_auto_conditioning_on"
        case isClimateOn          = "is_climate_on"
        case isImported           = "imported"
        case createdAt            = "created_at"
        case updatedAt            = "updated_at"
        
    }
}
