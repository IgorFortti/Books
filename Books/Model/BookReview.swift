//
//  BookReview.swift
//  Books
//
//  Created by Igor Fortti on 19/09/23.
//

import Foundation

struct BookReviewResponse: Codable {
    let status: String
    let copyright: String
    let numResults: Int
    let results: [BookReview]?

    enum CodingKeys: String, CodingKey {
        case status
        case copyright
        case numResults = "num_results"
        case results
    }
}

// MARK: - Result
struct BookReview: Codable {
    let url: String
    let publicationDt: String
    let byline: String
    let bookTitle: String
    let bookAuthor: String
    let summary: String
    let isbn13: [String]

    enum CodingKeys: String, CodingKey {
        case url
        case publicationDt = "publication_dt"
        case byline
        case bookTitle = "book_title"
        case bookAuthor = "book_author"
        case summary
        case isbn13
    }
}
