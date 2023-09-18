//
//  BestSellerCategoriesViewController.swift
//  Books
//
//  Created by Igor Fortti on 15/09/23.
//

import UIKit

class BestSellerCategoriesViewController: UIViewController {
    
    private let viewModel: BestSellerCategoriesViewModel = BestSellerCategoriesViewModel()

    @IBOutlet weak var bestSellerCategoriesTableView: UITableView! {
        didSet {
            bestSellerCategoriesTableView.separatorInset = .zero
            bestSellerCategoriesTableView.delegate = self
            bestSellerCategoriesTableView.dataSource = self
            bestSellerCategoriesTableView.register(BestSellerCategoryTableViewCell.nib(), forCellReuseIdentifier: BestSellerCategoryTableViewCell.identifier)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchBestSellerCategories()
        viewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = "Best Seller Categories"
        navigationController?.navigationBar.isHidden = false
    }
}

extension BestSellerCategoriesViewController: BestSellerCategoriesViewModelDelegate {
    func success() {
        DispatchQueue.main.async {
            self.bestSellerCategoriesTableView.reloadData()
        }
    }
    
    func failure(message: String) {
        debugPrint("Dados não foram buscados: \(message)")
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
}
