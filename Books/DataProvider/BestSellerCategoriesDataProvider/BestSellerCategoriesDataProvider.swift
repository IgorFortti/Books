//
//  BestSellerCategoriesDataProvider.swift
//  Books
//
//  Created by Igor Fortti on 15/09/23.
//

import Foundation

protocol BestSellerCategoriesDataProviderDelegate: GenericDataProviderDelegate {}

class BestSellerCategoriesDataProvider: DataProviderManager<BestSellerCategoriesDataProviderDelegate, BestSellerCategoriesResponse> {
    
    private let bestSellerCategoriesRequest: BestSellerCategoriesRequest?
    
    init(bestSellerCategoriesRequest: BestSellerCategoriesRequest = BestSellerCategoriesRequest()) {
        self.bestSellerCategoriesRequest = bestSellerCategoriesRequest
    }
    
    func fetchBestSellerCategories() {
        bestSellerCategoriesRequest?.fetchBestSellerCategories(completion: { result, error in
            if let error = error {
                self.delegate?.errorData(self.delegate, error: error)
            }
            
            if let result = result {
                print(result)
                self.delegate?.success(model: result)
            }
        })
    }
}
