//
//  BooksViewController.swift
//  Books
//
//  Created by Igor Fortti on 18/09/23.
//

import UIKit

class BooksViewController: UIViewController {
    
    private let viewModel: BooksViewModel
    private var customView: BooksView?
    
    init(data: BestSellerCategory) {
        self.viewModel = BooksViewModel(data: data)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.customView = BooksView()
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchBooks()
    }
}
