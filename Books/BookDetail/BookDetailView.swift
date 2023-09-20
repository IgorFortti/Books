//
//  BookDetailView.swift
//  Books
//
//  Created by Igor Fortti on 19/09/23.
//

import UIKit
import AlamofireImage

class BookDetailView: UIView {
    
    lazy var bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    lazy var descriptionContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.backgroundColor = .black
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .systemGray6
        label.backgroundColor = .clear
        label.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2
        let attributedText = NSAttributedString(string: " ",
                                                attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.attributedText = attributedText
        label.textAlignment = .justified
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    lazy var reviewsTableView: DinamicTableView = {
        let tableView = DinamicTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemGray6
        tableView.clipsToBounds = true
        tableView.layer.cornerRadius = 10
        tableView.sectionHeaderTopPadding = 8
        
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.bounces = false
        
        tableView.register(BookDetailReviewsTableViewCell.self, forCellReuseIdentifier: BookDetailReviewsTableViewCell.identifier)
        tableView.register(BookDetailReviewsTableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: BookDetailReviewsTableViewHeaderFooterView.identifier)
        return tableView
    }()

    init(_ delegate: UITableViewDelegate, _ dataSource: UITableViewDataSource) {
        super.init(frame: .zero)
        self.reviewsTableView.delegate = delegate
        self.reviewsTableView.dataSource = dataSource
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBookImageView(imageURL: String) {
        print("%%%%" + imageURL)
        guard let url = URL(string: imageURL) else { return }
        bookImageView.af.setImage(withURL: url)
    }
    
    func setupDescriptionLabel(description: String) {
        descriptionLabel.text = description
    }
    
    private func setupUI() {
        backgroundColor = .white
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        addSubview(bookImageView)
        addSubview(descriptionContainer)
        descriptionContainer.addSubview(descriptionLabel)
        addSubview(reviewsTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            bookImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            bookImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bookImageView.heightAnchor.constraint(equalToConstant: 250),
            bookImageView.widthAnchor.constraint(equalToConstant: 160),
            
            descriptionContainer.topAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: 30),
            descriptionContainer.leadingAnchor.constraint(equalTo: bookImageView.leadingAnchor),
            descriptionContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionContainer.topAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionContainer.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionContainer.trailingAnchor, constant: -8),
            descriptionLabel.bottomAnchor.constraint(equalTo: descriptionContainer.bottomAnchor, constant: -8),
            
            reviewsTableView.topAnchor.constraint(equalTo: descriptionContainer.bottomAnchor, constant: 5),
            reviewsTableView.leadingAnchor.constraint(equalTo: descriptionContainer.leadingAnchor),
            reviewsTableView.trailingAnchor.constraint(equalTo: descriptionContainer.trailingAnchor),
        ])
        let minHeightConstraint = descriptionContainer.heightAnchor.constraint(greaterThanOrEqualTo: descriptionLabel.heightAnchor, constant: 0)
        minHeightConstraint.priority = .defaultLow
        minHeightConstraint.isActive = true
    }
}
