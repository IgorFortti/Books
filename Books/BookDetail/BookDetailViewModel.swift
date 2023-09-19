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
    let dataProvider = BookReviewDataProvider()
    var book: Book
    var bookReviews: [BookReview]?
    
    init(data: Book) {
        self.book = data
    }
    
    func fetchBookReview() {
        dataProvider.fetchBookReview(isbn: book.primaryIsbn13) { [weak self] result, failure in
            if let result = result {
                if result.bookReviews.count != 0 {
                    for bookReview in result.bookReviews {
                        print("%%%%" + bookReview.summary)
                    }
                } else {
                    print("%%%%Esse livro não possui nenhum review")
                }
            } else if let failure = failure {
                self?.delegate?.failure(message: failure.localizedDescription)
            }
        }
    }
}
