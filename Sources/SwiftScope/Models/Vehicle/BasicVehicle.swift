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

    enum CodingKeys: String, CodingKey {
        case name
        case publicId = "public_id"
        case odometer
        case model
    }
}
