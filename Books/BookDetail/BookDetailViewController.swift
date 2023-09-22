//
//  BookDetailViewController.swift
//  Books
//
//  Created by Igor Fortti on 19/09/23.
//

import UIKit
import Alamofire

class BookDetailViewController: ViewController {
    
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
        doFetchBookReview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        super.viewWillAppear(animated)
    }
    
    private func doFetchBookReview() {
        Loading.shared.start(from: customView ?? UIView())
        viewModel.fetchBookReview()
        viewModel.delegate = self
    }
    
    private func setupNavigationBar(title: String) {
        self.title = title
    }
    
    private func updateReviewsTableView() {
        if viewModel.getBookReviews.isEmpty {
            customView?.reviewsTableView.backgroundColor = .white
        } else {
            customView?.reviewsTableView.backgroundColor = .systemGray6
        }
        customView?.reviewsTableView.reloadData()
    }
    
    private func setupAuthorLabel(author: String) {
        customView?.authorLabel.text = author
    }
    
    private func setupPublisherLabel(publisher: String) {
        customView?.publisherLabel.text = publisher
    }
    
    private func setupRankLabel(rank: String) {
        customView?.rankLabel.text = "# \(rank)"
    }
    
    private func setupBookImageView(imageURL: String) {
        print("%%%%" + imageURL)
        guard let url = URL(string: imageURL) else { return }
        customView?.bookImageView.af.setImage(withURL: url)
    }
    
    private func setupDescriptionLabel(description: String) {
        if description.isEmpty {
            customView?.descriptionContainer.isHidden = true
        } else {
            customView?.descriptionLabel.text = description
        }
    }
}

extension BookDetailViewController: BookDetailViewModelDelegate {
    func success() {
        DispatchQueue.main.async {
            self.setupNavigationBar(title: self.viewModel.getBookTitle)
            self.setupAuthorLabel(author: self.viewModel.getBookAuthor)
            self.setupPublisherLabel(publisher: self.viewModel.getBookPublisher)
            self.setupRankLabel(rank: self.viewModel.getBookRank)
            self.setupBookImageView(imageURL: self.viewModel.getBookImageUrlString)
            self.setupDescriptionLabel(description: self.viewModel.getDescriptionBook)
            self.updateReviewsTableView()
            Loading.shared.stop(from: self.customView ?? UIView())
        }
    }
    
    func failure(message: String) {
        DispatchQueue.main.async {
            self.displayError(message: message)
        }
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
