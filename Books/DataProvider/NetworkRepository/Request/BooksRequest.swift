//
//  BooksRequest.swift
//  Books
//
//  Created by Igor Fortti on 15/09/23.
//

import Foundation

protocol BooksRequestProtocol: GenericRequestProtocol {
    func fetchBooks(bestSellerCategories: String, completion: @escaping completion<BooksResponse?>)
}

class BooksRequest: GenericRequest, BooksRequestProtocol {
    
    func fetchBooks(bestSellerCategories: String, completion: @escaping completion<BooksResponse?>) {
        do {
            guard let url = try BooksRouter.books(bestSellerCategories: bestSellerCategories).asUrlRequest() else {
                return completion(nil, error)
            }
            request(urlRequest: url, completion: completion)
        } catch let error {
            completion(nil, error)
        }
    }
}
