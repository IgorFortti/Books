//
//  BookDetailViewModel.swift
//  Books
//
//  Created by Igor Fortti on 19/09/23.
//

import Foundation

protocol BookDetailViewModelDelegate: AnyObject{
    func success()
    func failure(message: String)
}

class BookDetailViewModel {
    
    weak var delegate: BookDetailViewModelDelegate?
    private let dataProvider = BookReviewDataProvider()
    private var bookReviews: [BookReview] = []
    var book: Book
    
    var getBookImageUrlString: String {
        return book.bookImage
    }
    
    var getDescriptionBook: String {
        return book.description
    }
    
    var getBookReviews: [BookReview] {
        return bookReviews
    }
    
    init(data: Book) {
        self.book = data
    }
    
    func fetchBookReview() {
        dataProvider.fetchBookReview(isbn: "9780307476463") { [weak self] result, failure in
            if let result = result {
                self?.bookReviews = result.bookReviews
                self?.delegate?.success()
            } else if let failure = failure {
                self?.delegate?.failure(message: failure.localizedDescription)
            }
        }
    }
}
