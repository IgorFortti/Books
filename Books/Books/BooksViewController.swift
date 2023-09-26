//
//  BooksViewController.swift
//  Books
//
//  Created by Igor Fortti on 18/09/23.
//

import UIKit
import VisualKit

class BooksViewController: VKViewController {
    
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
        doFetchBooks()
    }
    
    private func doFetchBooks() {
        VKLoading.shared.start(from: customView ?? UIView())
        viewModel.fetchBooks()
        viewModel.delegate = self
    }
    
    private func setupNavigationBar(title: String) {
        navigationController?.navigationBar.isHidden = false
        self.title = title
    }
    
    func setupTitleLabel(title: String) {
        customView?.titleLabel.text = title
    }
}

extension BooksViewController: BooksViewModelDelegate {
    func success() {
        DispatchQueue.main.async {
            self.setupNavigationBar(title: self.viewModel.getTitle)
            self.customView?.tableView.reloadData()
            VKLoading.shared.stop(from: self.customView ?? UIView())
        }
    }
    
    func failure(message: String) {
        DispatchQueue.main.async {
            self.displayError(message: message)
        }
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
        return CGFloat(viewModel.getBooks[indexPath.row].bookImageHeight) + 35
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = viewModel.getBooks[indexPath.row]
        let viewController = BookDetailViewController(data: selectedCell)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
