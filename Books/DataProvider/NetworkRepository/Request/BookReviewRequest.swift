//
//  BookReviewRequest.swift
//  Books
//
//  Created by Igor Fortti on 19/09/23.
//

import Foundation

protocol BookReviewRequestProtocol: GenericRequestProtocol {
    func fetchBooks(isbn: String, completion: @escaping completion<BookReviewResponse?>)
}

class BookReviewRequest: GenericRequest, BookReviewRequestProtocol {
    
    func fetchBooks(isbn: String, completion: @escaping completion<BookReviewResponse?>) {
        do {
            guard let url = try BookReviewRouter.bookReview(isbn: isbn).asUrlRequest() else {
                return completion(nil, error)
            }
            request(urlRequest: url, completion: completion)
        } catch let error {
            completion(nil, error)
        }
    }
}
