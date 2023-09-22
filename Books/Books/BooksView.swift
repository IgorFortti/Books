//
//  BooksView.swift
//  Books
//
//  Created by Igor Fortti on 18/09/23.
//

import UIKit

class BooksView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.numberOfLines = 0
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(BooksTableViewCell.self, forCellReuseIdentifier: BooksTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    init(_ tableViewDataSource: UITableViewDataSource, _ tableViewDelegate: UITableViewDelegate) {
        super.init(frame: .zero)
        self.tableView.dataSource = tableViewDataSource
        self.tableView.delegate = tableViewDelegate
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
        addSubview(titleLabel)
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
