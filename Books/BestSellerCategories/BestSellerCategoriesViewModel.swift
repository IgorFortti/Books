//
//  BestSellerCategoriesViewModel.swift
//  Books
//
//  Created by Igor Fortti on 18/09/23.
//

import Foundation

protocol BestSellerCategoriesViewModelDelegate: AnyObject {
    func success()
    func failure(message: String)
}

class BestSellerCategoriesViewModel {
    
    weak var delegate: BestSellerCategoriesViewModelDelegate?
    private let dataProvider: BestSellerCategoriesDataProvider
    
    private var bestSellerCategories: [BestSellerCategory] = [] {
        didSet {
            updateFilteredList(searchText: searchText)
        }
    }
    
    
    private var filteredBestSellerCategories: [BestSellerCategory] = [] {
        didSet {
            delegate?.success()
        }
    }
    
    private var searchText: String = "" {
        didSet {
            updateFilteredList(searchText: searchText)
        }
    }
    
    
    var getBestSellerCategories: [BestSellerCategory] {
        return filteredBestSellerCategories
    }
    
    init(dataProvider: BestSellerCategoriesDataProvider = BestSellerCategoriesDataProvider()) {
        self.dataProvider = dataProvider
    }
    
    private func updateFilteredList(searchText: String) {
        if searchText.isEmpty {
            filteredBestSellerCategories = bestSellerCategories
        } else {
            filteredBestSellerCategories = bestSellerCategories.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    func updateSearchText(text: String) {
        searchText = text
    }
    
    func fetchBestSellerCategories() {
        dataProvider.fetchBestSellerCategories { [weak self] result, failure in
            if let result = result {
                self?.bestSellerCategories = result.categories
            } else if let failure = failure {
                self?.delegate?.failure(message: failure.localizedDescription)
            }
        }
    }
}
