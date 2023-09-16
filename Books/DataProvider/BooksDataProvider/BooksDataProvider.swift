//
//  BooksDataProvider.swift
//  Books
//
//  Created by Igor Fortti on 15/09/23.
//

import Foundation

protocol BooksDataProviderDelegate: GenericDataProviderDelegate {}

class BooksDataProvider: DataProviderManager<BooksDataProviderDelegate, BooksResponse> {
    
    private let booksRequest: BooksRequest?
    
    init(booksRequest: BooksRequest = BooksRequest()) {
        self.booksRequest = booksRequest
    }
    
    func fetchBestSellerCategories(bestSellerCategories: String) {
        booksRequest?.fetchBooks(bestSellerCategories: bestSellerCategories, completion: { result, error in
            if let error = error {
                self.delegate?.errorData(self.delegate, error: error)
            }
            
            if let result = result {
                print(result)
                self.delegate?.success(model: result)
            }
        })
    }
}
