//
//  VKLoading.swift
//  VisualKit
//
//  Created by Igor Fortti on 18/09/23.
//

import UIKit

public class VKLoading {
    
    public static let shared = VKLoading()
    
    private init() {}
    
    public func start(from view: UIView, isBackground: Bool = true, isLarge: Bool = true) {
        let loading = VKLoadingView(parrentView: view, isBackground: isBackground, isLarge: isLarge)
        loading.indicatorView.startAnimating()
        view.addSubview(loading)
        loading.setupUI()
    }
    
    public func stop(from view: UIView) {
        for view in view.subviews {
            if let view = view as? VKLoadingView {
                view.indicatorView.stopAnimating()
                view.removeFromSuperview()
            }
        }
    }
}
