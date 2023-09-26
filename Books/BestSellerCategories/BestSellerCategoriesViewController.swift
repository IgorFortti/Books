//
//  BestSellerCategoriesViewController.swift
//  Books
//
//  Created by Igor Fortti on 15/09/23.
//

import UIKit
import VisualKit

class BestSellerCategoriesViewController: VKViewController {
    
    private let viewModel: BestSellerCategoriesViewModel = BestSellerCategoriesViewModel()
    
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.clipsToBounds = true
            searchBar.isHidden = true
            searchBar.layer.cornerRadius = 10
            searchBar.placeholder = "Search"
            searchBar.returnKeyType = .search
            searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
            searchBar.delegate = self
        }
    }
    
    

    @IBOutlet weak var bestSellerCategoriesTableView: UITableView! {
        didSet {
            bestSellerCategoriesTableView.separatorInset = .zero
            bestSellerCategoriesTableView.showsVerticalScrollIndicator = false
            bestSellerCategoriesTableView.delegate = self
            bestSellerCategoriesTableView.dataSource = self
            bestSellerCategoriesTableView.register(BestSellerCategoryTableViewCell.nib(), forCellReuseIdentifier: BestSellerCategoryTableViewCell.identifier)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doFetchBestSellerCategories()
    }
    
    private func doFetchBestSellerCategories() {
        VKLoading.shared.start(from: bestSellerCategoriesTableView, isBackground: false)
        viewModel.fetchBestSellerCategories()
        viewModel.delegate = self
    }
    
    private func setupNavigationBar(title: String) {
        navigationController?.navigationBar.isHidden = false
        self.title = title
    }
}

extension BestSellerCategoriesViewController: BestSellerCategoriesViewModelDelegate {
    func success() {
        DispatchQueue.main.async {
            self.setupNavigationBar(title: self.viewModel.getTitle)
            self.searchBar.isHidden = false
            self.bestSellerCategoriesTableView.reloadData()
            VKLoading.shared.stop(from: self.bestSellerCategoriesTableView)
        }
    }
    
    func failure(message: String) {
        DispatchQueue.main.async {
            self.displayError(message: message)
        }
    }
}

extension BestSellerCategoriesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.updateSearchText(text: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        UIView.transition(with: searchBar, duration: 0.5, options: .transitionCrossDissolve) {
            searchBar.showsCancelButton = false
            searchBar.resignFirstResponder()
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        UIView.transition(with: searchBar, duration: 0.5, options: .transitionCrossDissolve) {
            searchBar.showsCancelButton = true
            searchBar.becomeFirstResponder()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        UIView.transition(with: searchBar, duration: 0.5, options: .transitionCrossDissolve) {
            searchBar.showsCancelButton = false
            searchBar.resignFirstResponder()
        }
    }
}

extension BestSellerCategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getBestSellerCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BestSellerCategoryTableViewCell.identifier, for: indexPath) as? BestSellerCategoryTableViewCell
        cell?.setupCell(data: viewModel.getBestSellerCategories[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = viewModel.getBestSellerCategories[indexPath.row]
        let viewController = BooksViewController(data: selectedCell)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
