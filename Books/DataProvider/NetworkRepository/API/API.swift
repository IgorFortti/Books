//
//  API.swift
//  Books
//
//  Created by Igor Fortti on 15/09/23.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
}

struct API {
    
    static let baseUrl = "https://api.nytimes.com/svc/books/v3"
    static let apiKey = "c7aZd6hs6I6NOIpOHOlCUDDuhAleD3Pe"
    static let bestSellerCategories = "/lists/names.json"
    static let books = "/lists/current/%@.json"
}
