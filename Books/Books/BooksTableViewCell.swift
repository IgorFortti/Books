//
//  BooksTableViewCell.swift
//  Books
//
//  Created by Igor Fortti on 18/09/23.
//

import UIKit
import AlamofireImage

class BooksTableViewCell: UITableViewCell {
    // MARK: - Properties
    static let identifier: String = String(describing: BooksTableViewCell.self)
    
//    lazy var bookTitleLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
//        label.textColor = .black
//        label.textAlignment = .center
//        label.backgroundColor = .clear
//        return label
//    }()
    
    lazy var bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        Loading.shared.start(from: contentView, isBackground: false, isLarge: false)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Public Methods
    public func setupCell(data: Book) {
//        bookTitleLabel.text = data.title
        guard let url = URL(string: data.bookImage) else { return }
        DispatchQueue.main.async {
            self.bookImageView.af.setImage(withURL: url)
            Loading.shared.stop(from: self.contentView)
        }
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        selectionStyle = .none
        addSubviews()
        setupContraints()
    }
    
    private func addSubviews() {
//        contentView.addSubview(bookTitleLabel)
        contentView.addSubview(bookImageView)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
//            bookTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
//            bookTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            
            bookImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            bookImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bookImageView.widthAnchor.constraint(equalToConstant: 320),
            bookImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
