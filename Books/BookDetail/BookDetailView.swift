//
//  BookDetailView.swift
//  Books
//
//  Created by Igor Fortti on 19/09/23.
//

import UIKit

class BookDetailView: UIView {
    
    lazy var authorTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .right
        label.backgroundColor = .clear
        label.text = "Author"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.textAlignment = .right
        label.backgroundColor = .clear
        label.numberOfLines = 0
        return label
    }()
    
    lazy var publisherTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .right
        label.backgroundColor = .clear
        label.text = "Publisher"
        return label
    }()
    
    lazy var publisherLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.textAlignment = .right
        label.backgroundColor = .clear
        label.numberOfLines = 0
        return label
    }()
    
    lazy var rankContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.backgroundColor = .systemGray6
        return view
    }()
    
    lazy var rankTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .white
        label.text = "NYT Rank"
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    lazy var rankLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 60, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .white
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
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
        view.backgroundColor = .systemGray5
        return view
    }()
    
    lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = "Description"
        return label
    }()
    
    lazy var descriptionLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.backgroundColor = .clear
        label.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2
        let attributedText = NSAttributedString(string: " ",
                                                attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.attributedText = attributedText
        label.textAlignment = .natural
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    lazy var reviewsTableView: DinamicTableView = {
        let tableView = DinamicTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
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
    
    private func setupUI() {
        backgroundColor = .white
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        addSubview(authorTitleLabel)
        addSubview(authorLabel)
        addSubview(publisherTitleLabel)
        addSubview(publisherLabel)
        addSubview(rankContainer)
        rankContainer.addSubview(rankLabel)
        rankContainer.addSubview(rankTitleLabel)
        addSubview(bookImageView)
        addSubview(descriptionContainer)
        descriptionContainer.addSubview(descriptionLabel)
        descriptionContainer.addSubview(descriptionLineView)
        descriptionContainer.addSubview(descriptionTitleLabel)
        addSubview(reviewsTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            rankContainer.topAnchor.constraint(equalTo: bookImageView.topAnchor),
            rankContainer.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 20),
            rankContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            rankTitleLabel.topAnchor.constraint(equalTo: rankContainer.topAnchor, constant: 8),
            rankTitleLabel.leadingAnchor.constraint(equalTo: rankContainer.leadingAnchor, constant: 8),
            rankTitleLabel.trailingAnchor.constraint(equalTo: rankContainer.trailingAnchor, constant: -8),
            rankTitleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            rankLabel.topAnchor.constraint(equalTo: rankTitleLabel.bottomAnchor, constant: 8),
            rankLabel.leadingAnchor.constraint(equalTo: rankContainer.leadingAnchor, constant: 8),
            rankLabel.trailingAnchor.constraint(equalTo: rankContainer.trailingAnchor, constant: -8),
            rankLabel.bottomAnchor.constraint(equalTo: rankContainer.bottomAnchor, constant: -8),
            
            publisherTitleLabel.topAnchor.constraint(equalTo: rankContainer.bottomAnchor, constant: 8),
            publisherTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28),
            
            publisherLabel.topAnchor.constraint(equalTo: publisherTitleLabel.bottomAnchor),
            publisherLabel.trailingAnchor.constraint(equalTo: publisherTitleLabel.trailingAnchor),
            publisherLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 18),
            
            authorTitleLabel.bottomAnchor.constraint(equalTo: authorLabel.topAnchor),
            authorTitleLabel.trailingAnchor.constraint(equalTo: authorLabel.trailingAnchor),
            
            authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28),
            authorLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 18),
            
            bookImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            bookImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bookImageView.heightAnchor.constraint(equalToConstant: 250),
            bookImageView.widthAnchor.constraint(equalToConstant: 160),
            
            descriptionContainer.topAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: 40),
            descriptionContainer.leadingAnchor.constraint(equalTo: bookImageView.leadingAnchor),
            descriptionContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionContainer.topAnchor, constant: 38),
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionContainer.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionContainer.trailingAnchor, constant: -8),
            descriptionLabel.bottomAnchor.constraint(equalTo: descriptionContainer.bottomAnchor, constant: -8),
            
            descriptionTitleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -8),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            
            descriptionLineView.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -5),
            descriptionLineView.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            descriptionLineView.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            descriptionLineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            reviewsTableView.topAnchor.constraint(equalTo: descriptionContainer.bottomAnchor, constant: 40),
            reviewsTableView.leadingAnchor.constraint(equalTo: descriptionContainer.leadingAnchor),
            reviewsTableView.trailingAnchor.constraint(equalTo: descriptionContainer.trailingAnchor),
        ])
        
        let rankContainerBottomConstraint = rankContainer.bottomAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: -80)
        rankContainerBottomConstraint.priority = .defaultLow
        rankContainerBottomConstraint.isActive = true
        
        let authorTitleLabelTopConstraint = authorTitleLabel.topAnchor.constraint(equalTo: publisherLabel.bottomAnchor, constant: 10)
        authorTitleLabelTopConstraint.priority = .defaultLow
        authorTitleLabelTopConstraint.isActive = true
        
        let authorLabelBottomConstraintMinimun = authorLabel.bottomAnchor.constraint(lessThanOrEqualTo: descriptionContainer.topAnchor, constant: -10)
        authorLabelBottomConstraintMinimun.priority = .defaultHigh
        authorLabelBottomConstraintMinimun.isActive = true
        
        let authorLabelBottomConstraintMaximum = authorLabel.bottomAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: 0)
        authorLabelBottomConstraintMaximum.priority = .defaultLow
        authorLabelBottomConstraintMaximum.isActive = true
        
        let minContainerHeightConstraint = descriptionContainer.heightAnchor.constraint(greaterThanOrEqualTo: descriptionLabel.heightAnchor, constant: 0)
        minContainerHeightConstraint.priority = .defaultLow
        minContainerHeightConstraint.isActive = true
    }
}
