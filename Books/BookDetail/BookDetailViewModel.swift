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
    
    var getBookAuthor: String {
        return book.author
    }
    
    var getBookPublisher: String {
        return book.publisher
    }
    
    var getBookRank: String {
        return String(book.rank)
    }
    
    var getBookImageUrlString: String {
        return book.bookImage
    }
    
    var getDescriptionBook: String {
        return book.description
    }
    
    var getTitleBookDetailsReviewTableViewHeader: String {
        if bookReviews.count == 0 {
            return "There are no reviews yet"
        } else if bookReviews.count == 1 {
            return "Review"
        } else {
            return "Reviews"
        }
    }
    
    var getBookReviews: [BookReview] {
        return bookReviews
    }
    
    init(data: Book) {
        self.book = data
    }
    
    func fetchBookReview() {
        dataProvider.fetchBookReview(isbn: book.primaryIsbn13) { [weak self] result, failure in
            if let result = result {
                self?.bookReviews = result.bookReviews
                self?.delegate?.success()
            } else if let failure = failure {
                self?.delegate?.failure(message: failure.localizedDescription)
            }
        }
    }
}
