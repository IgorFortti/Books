//
//  LoadingView.swift
//  Books
//
//  Created by Igor Fortti on 18/09/23.
//

import UIKit

class LoadingView: UIView {
    
    private var parrentView: UIView
    private var isBackground = true
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.4)
        return view
    }()
    
    lazy var indicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.color = .systemGray5
        return activityIndicatorView
    }()
    
    init(parrentView: UIView, isBackground: Bool, isLarge: Bool) {
        self.parrentView = parrentView
        self.isBackground = isBackground
        super.init(frame: .zero)
        self.indicatorView.style = isLarge ? .large : .medium
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        if isBackground {
            addSubview(backgroundView)
            addSubview(indicatorView)
            
            NSLayoutConstraint.activate([
                backgroundView.topAnchor.constraint(equalTo: parrentView.topAnchor),
                backgroundView.leadingAnchor.constraint(equalTo: parrentView.leadingAnchor),
                backgroundView.trailingAnchor.constraint(equalTo: parrentView.trailingAnchor),
                backgroundView.bottomAnchor.constraint(equalTo: parrentView.bottomAnchor),
                
                indicatorView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
                indicatorView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor)
            ])
        } else {
            addSubview(indicatorView)
            
            NSLayoutConstraint.activate([
                indicatorView.centerXAnchor.constraint(equalTo: parrentView.centerXAnchor),
                indicatorView.centerYAnchor.constraint(equalTo: parrentView.centerYAnchor)
            ])
        }
    }
}

