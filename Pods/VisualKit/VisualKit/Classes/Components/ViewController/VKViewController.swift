//
//  VKViewController.swift
//  VisualKit
//
//  Created by Igor Fortti on 21/09/23.
//

import UIKit

open class VKViewController: UIViewController {

    open override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    private func dismissErrorView() {
        dismiss(animated: false, completion: nil)
    }
    
    open func displayError(message: String) {
        let error = VKErrorView(message: message, dismissAction: dismissErrorView) { action in
            switch action {
            case .tryAgain:
                self.viewDidLoad()
            case .cancel:
                self.navigationController?.popViewController(animated: false)
            }
        }
        let errorViewController = UIViewController()
        errorViewController.view = error
        errorViewController.modalPresentationStyle = .fullScreen
        present(errorViewController, animated: false)
    }
}
