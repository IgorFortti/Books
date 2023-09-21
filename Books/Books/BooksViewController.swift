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
        self.customView = BooksView(self, self)
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Loading.shared.start(from: customView ?? UIView())
        viewModel.fetchBooks()
        viewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = viewModel.getTitle
        navigationController?.navigationBar.isHidden = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func setupTitleLabel(title: String) {
        customView?.categoryNameLabel.text = title
    }
}

extension BooksViewController: BooksViewModelDelegate {
    func success() {
        DispatchQueue.main.async {
            self.setupTitleLabel(title: self.viewModel.getCategoryName)
            self.customView?.tableView.reloadData()
            Loading.shared.stop(from: self.customView ?? UIView())
        }
    }
    
    func failure(message: String) {
        print(message)
    }
}

extension BooksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BooksTableViewCell.identifier, for: indexPath) as? BooksTableViewCell
        cell?.setupCell(data: viewModel.getBooks[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let book = viewModel.getBooks[indexPath.row]
        let height = book.bookImageHeight
        return CGFloat(height) + 35
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = viewModel.getBooks[indexPath.row]
        let viewController = BookDetailViewController(data: selectedCell)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
