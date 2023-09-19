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
    var book: Book
    
    init(data: Book) {
        self.book = data
    }
}
