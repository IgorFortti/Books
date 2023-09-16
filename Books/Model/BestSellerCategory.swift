//
//  BestSellerCategory.swift
//  Books
//
//  Created by Igor Fortti on 15/09/23.
//

import Foundation

struct BestSellerCategoriesResponse: Codable {
    let categories: [BestSellerCategory]
    
    enum CodingKeys: String, CodingKey {
        case categories = "results"
    }
}

struct BestSellerCategory: Codable {
    let name: String
    let displayName: String
    let listNameEncoded: String
    let oldestPublishedDate: String
    let newestPublishedDate: String
    let updated: String

    enum CodingKeys: String, CodingKey {
        case name = "list_name"
        case displayName = "display_name"
        case listNameEncoded = "list_name_encoded"
        case oldestPublishedDate = "oldest_published_date"
        case newestPublishedDate = "newest_published_date"
        case updated
    }
}
