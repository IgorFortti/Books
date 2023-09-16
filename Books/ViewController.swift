//
//  ViewController.swift
//  Books
//
//  Created by Igor Fortti on 15/09/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let dataProvider = BestSellerCategoriesDataProvider()
//        dataProvider.fetchBestSellerCategories()
        let dataProvider = BooksDataProvider()
        dataProvider.fetchBestSellerCategories(bestSellerCategories: "hardcover-fiction")
    }


}

