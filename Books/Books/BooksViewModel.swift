//
//  BooksViewModel.swift
//  Books
//
//  Created by Igor Fortti on 18/09/23.
//

import Foundation

protocol BooksViewModelDelegate: AnyObject {
    func success()
    func failure(message: String)
}

class BooksViewModel {
    
    weak var delegate: BooksViewModelDelegate?
    let dataProvider = BooksDataProvider()
    var bestSellerCategory: BestSellerCategory
    var books: [Book] = []
    
    init(data: BestSellerCategory) {
        self.bestSellerCategory = data
        print("%%%%\(bestSellerCategory.name)")
    }
    
    func fetchBooks() {
        let bestSellerCategoryNameformmated = bestSellerCategory.name.replacingOccurrences(of: " ", with: "-").lowercased()
        dataProvider.fetchBooks(bestSellerCategories: bestSellerCategoryNameformmated) { [weak self] result, failure in
            if let result = result {
                self?.books = result.results.books
                self?.delegate?.success()
            } else if let failure = failure {
                self?.delegate?.failure(message: failure.localizedDescription)
            }
        }
    }
}
