//
//  ChargingSession.swift
//  
//
//  Created by Ilja Rozhko on 01.04.23.
//

import Foundation

public struct ChargingSession: Codable {
    public var id                     : Int
    public var vehicleId              : Int
    public var name                   : String?
    public var batteryLevelStart      : Int
    public var batteryRangeStart      : String
    public var batteryLevelEnd        : Int
    public var batteryRangeEnd        : String
    public var chargeEnergyAdded      : String
    public var chargeEnergyCalculated : String?
    public var chargeLimitSoc         : Int?
    public var connChargeCable        : String?
    public var fastChargerBrand       : String?
    public var fastChargerType        : String?
    public var fastChargerPresent     : String?
    public var odometer               : String?
    public var latitude               : String?
    public var longitude              : String?
    public var duration               : Int?
    public var cost                   : String?
    public var currency               : String?
    public var isPrivate              : Int
    public var importId               : String?
    public var createdAt              : String?
    public var updatedAt              : String?
    public var progress               : [ChargeProgress]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case vehicleId              = "vehicle_id"
        case name
        case batteryLevelStart      = "battery_level_start"
        case batteryRangeStart      = "battery_range_start"
        case batteryLevelEnd        = "battery_level_end"
        case batteryRangeEnd        = "battery_range_end"
        case chargeEnergyAdded      = "charge_energy_added"
        case chargeEnergyCalculated = "charge_energy_calculated"
        case chargeLimitSoc         = "charge_limit_soc"
        case connChargeCable        = "conn_charge_cable"
        case fastChargerBrand       = "fast_charger_brand"
        case fastChargerType        = "fast_charger_type"
        case fastChargerPresent     = "fast_charger_present"
        case odometer
        case latitude
        case longitude
        case duration
        case cost
        case currency
        case isPrivate              = "private"
        case importId               = "import_id"
        case createdAt              = "created_at"
        case updatedAt              = "updated_at"
        case progress
    }
}

public struct ChargeProgress: Codable {
    var id                        : Int?    = nil
    var chargeId                  : Int?    = nil
    var batteryLevel              : Int?    = nil
    var usableBatteryLevel        : Int?    = nil
    var batteryRange              : String? = nil
    var estBatteryRange           : String? = nil
    var chargeEnergyAdded         : String? = nil
    var chargeLimitSoc            : Int?    = nil
    var chargePortColdWeatherMode : Int?    = nil
    var chargePortDoorOpen        : Int?    = nil
    var chargePortLatch           : String? = nil
    var connChargeCable           : String? = nil
    var fastChargerBrand          : String? = nil
    var fastChargerType           : String? = nil
    var fastChargerPresent        : String? = nil
    var chargeRate                : String? = nil
    var chargerPower              : Int?    = nil
    var chargerVoltage            : Int?    = nil
    var chargingState             : String? = nil
    var minutesToFullCharge       : Int?    = nil
    var timeToFullCharge          : String? = nil
    var isImported                : Int?    = nil
    var createdAt                 : String? = nil
    var updatedAt                 : String? = nil
    
    enum CodingKeys: String, CodingKey {
        case id
        case chargeId                  = "charge_id"
        case batteryLevel              = "battery_level"
        case usableBatteryLevel        = "usable_battery_level"
        case batteryRange              = "battery_range"
        case estBatteryRange           = "est_battery_range"
        case chargeEnergyAdded         = "charge_energy_added"
        case chargeLimitSoc            = "charge_limit_soc"
        case chargePortColdWeatherMode = "charge_port_cold_weather_mode"
        case chargePortDoorOpen        = "charge_port_door_open"
        case chargePortLatch           = "charge_port_latch"
        case connChargeCable           = "conn_charge_cable"
        case fastChargerBrand          = "fast_charger_brand"
        case fastChargerType           = "fast_charger_type"
        case fastChargerPresent        = "fast_charger_present"
        case chargeRate                = "charge_rate"
        case chargerPower              = "charger_power"
        case chargerVoltage            = "charger_voltage"
        case chargingState             = "charging_state"
        case minutesToFullCharge       = "minutes_to_full_charge"
        case timeToFullCharge          = "time_to_full_charge"
        case isImported                = "imported"
        case createdAt                 = "created_at"
        case updatedAt                 = "updated_at"
    }
}
