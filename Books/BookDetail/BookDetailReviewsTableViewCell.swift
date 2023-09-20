//
//  BookDetailReviewsTableViewCell.swift
//  Books
//
//  Created by Igor Fortti on 19/09/23.
//

import UIKit

class BookDetailReviewsTableViewCell: UITableViewCell {
    // MARK: - Properties
    static let identifier: String = String(describing: BookDetailReviewsTableViewCell.self)
    
    lazy var summaryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.italicSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .natural
        label.backgroundColor = .clear
        label.numberOfLines = 0
        return label
    }()
    
    lazy var bylineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .right
        label.backgroundColor = .clear
        return label
    }()
    
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Public Methods
    public func setupCell(data: BookReview) {
        summaryLabel.text = String(format: "\"%@\"", data.summary)
        bylineLabel.text = "-" + " " + data.byline.capitalized
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        addSubviews()
        setupContraints()
    }
    
    private func addSubviews() {
        contentView.addSubview(summaryLabel)
        contentView.addSubview(bylineLabel)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            summaryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            summaryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            summaryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            summaryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -26),
            
            bylineLabel.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor),
            bylineLabel.rightAnchor.constraint(equalTo: summaryLabel.rightAnchor, constant: -8)
        ])
    }
}
