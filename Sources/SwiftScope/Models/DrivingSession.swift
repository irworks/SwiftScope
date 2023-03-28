//
//  DrivingSession.swift
//  
//
//  Created by Ilja Rozhko on 28.03.23.
//

import Foundation

public struct DrivingSession: Codable {
    var id                : Int
    var vehicleId         : Int
    var name              : String?
    var description       : String?
    var distance          : String
    var duration          : Int
    var avgSpeed          : Int
    var efficiency        : Int
    var batteryLevelStart : Int
    var batteryRangeStart : String
    var batteryLevelEnd   : Int
    var batteryRangeEnd   : String
    var latitudeStart     : String
    var longitudeStart    : String
    var latitudeEnd       : String
    var longitudeEnd      : String
    var isPrivate         : Int
    var type              : String
    var valet             : Int
    var hideSpeeding      : Int
    var importId          : String?
    var createdAt         : String
    var updatedAt         : String
    var progress          : [Progress]
    
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

public struct Progress: Codable {
    var id                   : Int
    var heading              : Int
    var latitude             : String
    var longitude            : String
    var odometer             : String
    var shiftState           : String?
    var power                : Int?
    var speed                : Int?
    var batteryLevel         : Int
    var usableBatteryLevel   : Int
    var batteryRange         : String
    var estBatteryRange      : String
    var fanStatus            : String
    var insideTemp           : String
    var outsideTemp          : String
    var isAutoConditioningOn : Int
    var isClimateOn          : Int
    var isImported           : Int
    var createdAt            : String
    var updatedAt            : String
    
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
