//
//  VKErrorView.swift
//  VisualKit
//
//  Created by Igor Fortti on 21/09/23.
//

import UIKit

public enum VKErrorViewAction {
    case tryAgain
    case cancel
}

public class VKErrorView: UIView {
    
    private var dismissAction: (() -> Void)?
    private var completionHandler: ((VKErrorViewAction) -> Void)?
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var exclamationImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "exclamationmark.triangle.fill")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .systemYellow
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var messageErrorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.numberOfLines = 0
        return label
    }()
    
    lazy var tryAgainButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.backgroundColor = .systemBlue
        button.setTitle("Try Again", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    @objc private func tryAgainButtonTapped() {
        dismissAction?()
        completionHandler?(.tryAgain)
    }
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    @objc private func cancelButtonTapped() {
        dismissAction?()
        completionHandler?(.cancel)
    }
    
    public init(message: String, dismissAction:(() -> Void)? = nil , completionHandler: ((VKErrorViewAction) -> Void)? = nil) {
        super.init(frame: .zero)
        setupUI()
        self.dismissAction = dismissAction
        self.completionHandler = completionHandler
        self.messageErrorLabel.text = message
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupUI() {
        addSubviews()
        setupConstraints()
        tryAgainButton.addTarget(self, action: #selector(tryAgainButtonTapped), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    private func addSubviews() {
        addSubview(backgroundView)
        backgroundView.addSubview(messageErrorLabel)
        backgroundView.addSubview(exclamationImageView)
        backgroundView.addSubview(tryAgainButton)
        backgroundView.addSubview(cancelButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            exclamationImageView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            exclamationImageView.heightAnchor.constraint(equalToConstant: 100),
            exclamationImageView.widthAnchor.constraint(equalToConstant: 100),
            exclamationImageView.bottomAnchor.constraint(equalTo: messageErrorLabel.topAnchor, constant: -40),
            
            messageErrorLabel.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            messageErrorLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            messageErrorLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20),
            
            tryAgainButton.topAnchor.constraint(equalTo: messageErrorLabel.bottomAnchor, constant: 40),
            tryAgainButton.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            tryAgainButton.widthAnchor.constraint(equalToConstant: 160),
            tryAgainButton.heightAnchor.constraint(equalToConstant: 40),
            
            cancelButton.topAnchor.constraint(equalTo: tryAgainButton.bottomAnchor, constant: 20),
            cancelButton.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor)
        ])
    }
}
