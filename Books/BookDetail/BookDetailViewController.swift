//
//  BookDetailViewController.swift
//  Books
//
//  Created by Igor Fortti on 19/09/23.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    private let viewModel: BookDetailViewModel
    private var customView: BookDetailView?
    
    init(data: Book) {
        self.viewModel = BookDetailViewModel(data: data)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        customView = BookDetailView()
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("%%%%\(viewModel.book.title)\n%%%%\(viewModel.book.author)\n%%%%\(viewModel.book.primaryIsbn13)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = viewModel.book.title
        navigationController?.navigationBar.isHidden = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

}
