//
//  Books.swift
//  Books
//
//  Created by Igor Fortti on 15/09/23.
//

import Foundation

struct BooksResponse: Codable {
    let status: String
    let copyright: String
    let numResults: Int
    let lastModified: String
    let results: BookList
    
    enum CodingKeys: String, CodingKey {
        case status
        case copyright
        case numResults = "num_results"
        case lastModified = "last_modified"
        case results
    }
}

struct BookList: Codable {
    let listName: String
    let bestsellersDate: String
    let publishedDate: String
    let displayName: String
    let normalListEndsAt: Int
    let updated: String
    let books: [Book]
    
    enum CodingKeys: String, CodingKey {
        case listName = "list_name"
        case bestsellersDate = "bestsellers_date"
        case publishedDate = "published_date"
        case displayName = "display_name"
        case normalListEndsAt = "normal_list_ends_at"
        case updated
        case books
    }
}

struct Book: Codable {
    let rank: Int
    let rankLastWeek: Int
    let weeksOnList: Int
    let asterisk: Int
    let dagger: Int
    let primaryIsbn10: String
    let primaryIsbn13: String
    let publisher: String
    let description: String
    let price: String
    let title: String
    let author: String
    let contributor: String
    let contributorNote: String
    let bookImage: String
    let bookImageHeight: Int
    let amazonProductURL: String
    let ageGroup: String
    let bookReviewLink: String
    let firstChapterLink: String
    let sundayReviewLink: String
    let articleChapterLink: String

    enum CodingKeys: String, CodingKey {
        case rank
        case rankLastWeek = "rank_last_week"
        case weeksOnList = "weeks_on_list"
        case asterisk
        case dagger
        case primaryIsbn10 = "primary_isbn10"
        case primaryIsbn13 = "primary_isbn13"
        case publisher
        case description
        case price
        case title
        case author
        case contributor
        case contributorNote = "contributor_note"
        case bookImage = "book_image"
        case bookImageHeight = "book_image_height"
        case amazonProductURL = "amazon_product_url"
        case ageGroup = "age_group"
        case bookReviewLink = "book_review_link"
        case firstChapterLink = "first_chapter_link"
        case sundayReviewLink = "sunday_review_link"
        case articleChapterLink = "article_chapter_link"
    }
}
