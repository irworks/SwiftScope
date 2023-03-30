//
//  SoftwareVersion.swift
//  
//
//  Created by Ilja Rozhko on 30.03.23.
//

import Foundation

public struct SoftwareVersion: Codable {
  public var version      : String
  public var features     : [String]
  public var earlyAccess  : Int
  public var fsd          : String?
  public var commit       : String
  public var totalCount   : Int
  public var count        : Int
  public var percentage   : Double
  public var year         : String
  public var week         : String
  public var major        : String
  public var minor        : String?
  public var pending      : Pending
  public var countries    : [Country]
  public var firstSpotted : String?

  enum CodingKeys: String, CodingKey {
    case version      = "version"
    case features     = "features"
    case earlyAccess  = "early_access"
    case fsd          = "fsd"
    case commit       = "commit"
    case totalCount   = "totalCount"
    case count        = "count"
    case percentage   = "percentage"
    case year         = "year"
    case week         = "week"
    case major        = "major"
    case minor        = "minor"
    case pending      = "pending"
    case countries    = "countries"
    case firstSpotted = "firstSpotted"
  }

}

public struct Pending: Codable {
  var waiting     : Int
  var available   : Int
  var downloading : Int
  var installing  : Int
}

public struct Country: Codable {
    public var country : String?
    public var count   : Int
}
