//
//  BestSellerCategoriesDataProvider.swift
//  Books
//
//  Created by Igor Fortti on 15/09/23.
//

import Foundation

class BestSellerCategoriesDataProvider {
    
    private let bestSellerCategoriesRequest: BestSellerCategoriesRequest?
    
    init(bestSellerCategoriesRequest: BestSellerCategoriesRequest = BestSellerCategoriesRequest()) {
        self.bestSellerCategoriesRequest = bestSellerCategoriesRequest
    }
    
    func fetchBestSellerCategories(completion: @escaping completion<BestSellerCategoriesResponse?>) {
        bestSellerCategoriesRequest?.fetchBestSellerCategories(completion: completion)
    }
}
