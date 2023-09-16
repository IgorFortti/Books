//
//  BooksDataProvider.swift
//  Books
//
//  Created by Igor Fortti on 15/09/23.
//

import Foundation

class BooksDataProvider {
    
    private let booksRequest: BooksRequest?
    
    init(booksRequest: BooksRequest = BooksRequest()) {
        self.booksRequest = booksRequest
    }
    
    func fetchBooks(bestSellerCategories: String, completion: @escaping completion<BooksResponse?>) {
        booksRequest?.fetchBooks(bestSellerCategories: bestSellerCategories, completion: completion)
    }
}
