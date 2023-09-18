//
//  BestSellerCategoryTableViewCell.swift
//  Books
//
//  Created by Igor Fortti on 18/09/23.
//

import UIKit

class BestSellerCategoryTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: BestSellerCategoryTableViewCell.self)

    @IBOutlet weak var nameLabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func setupCell(data: BestSellerCategory) {
        nameLabel.text = data.name
    }
}
