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
    
    private let dataProvider: BestSellerCategoriesDataProvider
    private var bestSellerCategories: [BestSellerCategory] = []
    weak var delegate: BestSellerCategoriesViewModelDelegate?
    
    var getBestSellerCategories: [BestSellerCategory] {
        return bestSellerCategories
    }
    
    init(dataProvider: BestSellerCategoriesDataProvider = BestSellerCategoriesDataProvider()) {
        self.dataProvider = dataProvider
    }
    
    func fetchBestSellerCategories() {
        dataProvider.fetchBestSellerCategories { [weak self] result, failure in
            if let result = result {
                self?.bestSellerCategories = result.categories
                self?.delegate?.success()
            } else if let failure = failure {
                self?.delegate?.failure(message: failure.localizedDescription)
            }
        }
    }
}
