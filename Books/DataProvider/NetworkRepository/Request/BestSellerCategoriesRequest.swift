//
//  BestSellerCategoriesRequest.swift
//  Books
//
//  Created by Igor Fortti on 15/09/23.
//

import Foundation

protocol BestSellerCategoriesRequestProtocol: GenericRequestProtocol {
    func fetchBestSellerCategories(completion: @escaping completion<BestSellerCategoriesResponse?>)
}

class BestSellerCategoriesRequest: GenericRequest, BestSellerCategoriesRequestProtocol {
    
    func fetchBestSellerCategories(completion: @escaping completion<BestSellerCategoriesResponse?>) {
        do {
            guard let url = try BestSellerCategoriesRouter.bestSellerCategories.asUrlRequest() else {
                return completion(nil, error)
            }
            request(urlRequest: url, completion: completion)
        } catch let error {
            completion(nil, error)
        }
    }
}
