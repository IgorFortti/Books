//
//  BooksView.swift
//  Books
//
//  Created by Igor Fortti on 18/09/23.
//

import UIKit

class BooksView: UIView {
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.clipsToBounds = true
        searchBar.layer.cornerRadius = 10
        searchBar.placeholder = "Search"
        searchBar.returnKeyType = .search
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        return searchBar
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(BooksTableViewCell.self, forCellReuseIdentifier: BooksTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()

    init(_ tableViewDataSource: UITableViewDataSource, _ tableViewDelegate: UITableViewDelegate, _ searchBarDelegate: UISearchBarDelegate) {
        super.init(frame: .zero)
        self.tableView.dataSource = tableViewDataSource
        self.tableView.delegate = tableViewDelegate
        self.searchBar.delegate = searchBarDelegate
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
        addSubview(searchBar)
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            
            tableView.topAnchor.constraint(equalTo: searchBar.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
