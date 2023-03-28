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

open class JsonResponseArray<T: Codable>: Codable {
    open var response: [T] = []
}

open class PaginatedJsonResponse<T: Codable>: Codable {
    open var currentPage: Int
    open var from: Int
    open var to: Int
    open var perPage: Int
    open var firstPageUrl: String
    open var nextPageUrl: String
    open var prevPageUrl: String
    open var data: [T] = []
    
    open var nextPage: Int
    open var prevPage: Int
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case from
        case to
        case perPage = "per_page"
        case firstPageUrl = "first_page_url"
        case nextPageUrl = "next_page_url"
        case prevPageUrl = "prev_page_url"
        case data
    }
    
    required public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<PaginatedJsonResponse<T>.CodingKeys> = try decoder.container(keyedBy: PaginatedJsonResponse<T>.CodingKeys.self)
        self.currentPage = try container.decode(Int.self, forKey: PaginatedJsonResponse<T>.CodingKeys.currentPage)
        self.from = try container.decode(Int.self, forKey: PaginatedJsonResponse<T>.CodingKeys.from)
        self.to = try container.decode(Int.self, forKey: PaginatedJsonResponse<T>.CodingKeys.to)
        self.perPage = try container.decode(Int.self, forKey: PaginatedJsonResponse<T>.CodingKeys.perPage)
        self.firstPageUrl = try container.decode(String.self, forKey: PaginatedJsonResponse<T>.CodingKeys.firstPageUrl)
        self.nextPageUrl = try container.decode(String.self, forKey: PaginatedJsonResponse<T>.CodingKeys.nextPageUrl)
        self.prevPageUrl = try container.decode(String.self, forKey: PaginatedJsonResponse<T>.CodingKeys.prevPageUrl)
        self.data = try container.decode([T].self, forKey: PaginatedJsonResponse<T>.CodingKeys.data)
        
        self.nextPage = self.currentPage + 1
        self.prevPage = max(0, self.currentPage - 1)
    }
}
