//
//  BooksTableViewCell.swift
//  Books
//
//  Created by Igor Fortti on 18/09/23.
//

import UIKit

class BooksTableViewCell: UITableViewCell {
    // MARK: - Properties
    static let identifier: String = String(describing: BooksTableViewCell.self)
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
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
    public func setupCell(data: Book) {
        titleLabel.text = data.title
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        selectionStyle = .none
        addSubviews()
        setupContraints()
    }
    
    private func addSubviews() {
        contentView.addSubview(titleLabel)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}
