//
//  Extensions.swift
//  Books
//
//  Created by Igor Fortti on 19/09/23.
//

import UIKit

extension UILabel {
    var insets: UIEdgeInsets {
        get {
            return UIEdgeInsets(
                top: self.textInsets.top,
                left: self.textInsets.left,
                bottom: self.textInsets.bottom,
                right: self.textInsets.right
            )
        }
        set {
            self.textInsets = newValue
        }
    }

    private var textInsets: UIEdgeInsets {
        get {
            if let value = objc_getAssociatedObject(self, &AssociatedKeys.textInsets) as? NSValue {
                var edgeInsets = UIEdgeInsets.zero
                value.getValue(&edgeInsets)
                return edgeInsets
            }
            return UIEdgeInsets.zero
        }
        set {
            var newValueCopy = newValue
            let value = NSValue(pointer: &newValueCopy)
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.textInsets,
                value,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
}

// Chaves associadas para armazenar as margens personalizadas
private struct AssociatedKeys {
    static var textInsets = "UILabel.textInsets"
}
