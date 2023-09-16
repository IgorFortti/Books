//
//  BestSellerCategoriesRouter.swift
//  Books
//
//  Created by Igor Fortti on 15/09/23.
//

import Foundation

enum BestSellerCategoriesRouter {
    
    case bestSellerCategories
    
    var path: String {
        switch self {
        case .bestSellerCategories:
            return API.bestSellerCategories
        }
    }
    
    func asUrlRequest() throws -> URLRequest? {
        guard var urlComponents = URLComponents(string: "\(API.baseUrl)\(path)") else { return nil }
        urlComponents.queryItems = [URLQueryItem(name: "api-key", value: API.apiKey)]
        guard let url = urlComponents.url else { return nil }
        let urlRequest = URLRequest(url: url)
        switch self {
        case .bestSellerCategories:
            return urlRequest
        }
    }
}
