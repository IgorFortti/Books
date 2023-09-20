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
        customView = BookDetailView(self, self)
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Loading.shared.start(from: customView ?? UIView())
        viewModel.fetchBookReview()
        viewModel.delegate = self
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
    
    private func updateReviewsTableView() {
        if viewModel.getBookReviews.count == 0 {
            customView?.reviewsTableView.backgroundColor = .white
        } else {
            customView?.reviewsTableView.backgroundColor = .systemGray6
        }
        customView?.reviewsTableView.reloadData()
    }
}

extension BookDetailViewController: BookDetailViewModelDelegate {
    func success() {
        DispatchQueue.main.async {
            self.customView?.setupAuthorLabel(author: self.viewModel.getBookAuthor)
            self.customView?.setupPublisherLabel(publisher: self.viewModel.getBookPublisher)
            self.customView?.setupRankLabel(rank: self.viewModel.getBookRank)
            self.customView?.setupBookImageView(imageURL: self.viewModel.getBookImageUrlString)
            self.customView?.setupDescriptionLabel(description: self.viewModel.getDescriptionBook)
            self.updateReviewsTableView()
            Loading.shared.stop(from: self.customView ?? UIView())
        }
    }
    
    func failure(message: String) {
        print(message)
    }
}

extension BookDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getBookReviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookDetailReviewsTableViewCell.identifier, for: indexPath) as? BookDetailReviewsTableViewCell
        cell?.setupCell(data: viewModel.getBookReviews[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: BookDetailReviewsTableViewHeaderFooterView.identifier) as? BookDetailReviewsTableViewHeaderFooterView
        header?.setupHeader(title: viewModel.getTitleBookDetailsReviewTableViewHeader)
        return header ?? UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
}
