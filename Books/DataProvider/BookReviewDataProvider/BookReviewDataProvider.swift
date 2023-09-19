//
//  BookReviewDataProvider.swift
//  Books
//
//  Created by Igor Fortti on 19/09/23.
//

import Foundation

class BookReviewDataProvider {
    
    private let bookReviewResquest: BookReviewRequest?
    
    init(bookReviewResquest: BookReviewRequest = BookReviewRequest()) {
        self.bookReviewResquest = bookReviewResquest
    }
    
    func fetchBookReview(isbn: String, completion: @escaping completion<BookReviewResponse?>) {
        bookReviewResquest?.fetchBooks(isbn: isbn, completion: completion)
    }
}
