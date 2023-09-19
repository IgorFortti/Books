//
//  BookReviewRouter.swift
//  Books
//
//  Created by Igor Fortti on 19/09/23.
//

import Foundation

enum BookReviewRouter {
    
    case bookReview(isbn: String)
    
    var path: String {
        switch self {
        case .bookReview:
            return API.bookReview
        }
    }
    
    func asUrlRequest() throws -> URLRequest? {
        switch self {
        case .bookReview(let isbn):
            guard var urlComponents = URLComponents(string: "\(API.baseUrl)\(path)") else { return nil }
            urlComponents.queryItems = [URLQueryItem(name: "api-key", value: API.apiKey),
                                        URLQueryItem(name: "isbn", value: isbn)]
            guard let url = urlComponents.url else { return nil }
            let urlRequest = URLRequest(url: url)
            return urlRequest
        }
    }
}
