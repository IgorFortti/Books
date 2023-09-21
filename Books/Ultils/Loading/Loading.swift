//
//  Loading.swift
//  Books
//
//  Created by Igor Fortti on 18/09/23.
//

import UIKit

class Loading {
    
    public static let shared = Loading()
    
    private init() {}
    
    func start(from view: UIView, isBackground: Bool = true, isLarge: Bool = true) {
        let loading = LoadingView(parrentView: view, isBackground: isBackground, isLarge: isLarge)
        loading.indicatorView.startAnimating()
        view.addSubview(loading)
        loading.setupUI()
    }
    
    func stop(from view: UIView) {
        for view in view.subviews {
            if let view = view as? LoadingView {
                view.indicatorView.stopAnimating()
                view.removeFromSuperview()
            }
        }
    }
}
