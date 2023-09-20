//
//  File.swift
//  Books
//
//  Created by Igor Fortti on 20/09/23.
//

import UIKit

class DinamicTableView: UITableView {
    override var contentSize: CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        let maxHeight: CGFloat = UIScreen.main.bounds.size.height - 100
        let height = min(contentSize.height, maxHeight)
        isScrollEnabled = (maxHeight == height)
        return CGSize(width: UIView.noIntrinsicMetric, height: height)
    }
}
