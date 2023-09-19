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
        self.customView = BooksView(self, self, self)
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchBooks()
        viewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = viewModel.bestSellerCategory.name
        navigationController?.navigationBar.isHidden = false
    }
}

extension BooksViewController: BooksViewModelDelegate {
    func success() {
        DispatchQueue.main.async {
            self.customView?.tableView.reloadData()
        }
    }
    
    func failure(message: String) {
        print(message)
    }
}

extension BooksViewController: UISearchBarDelegate {
    
}

extension BooksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BooksTableViewCell.identifier, for: indexPath) as? BooksTableViewCell
        cell?.setupCell(data: viewModel.books[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let book = viewModel.books[indexPath.row]
        let height = book.bookImageHeight
        return CGFloat(height) + 26
    }
}
