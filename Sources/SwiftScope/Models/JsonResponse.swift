//
//  File.swift
//  
//
//  Created by Ilja Rozhko on 28.03.23.
//

import Foundation

open class JsonResponse<T: Codable>: Codable {
    open var response: T
}

open class JsonResponseArray<T: Decodable>: Decodable {
    open var response: [T] = []
}
