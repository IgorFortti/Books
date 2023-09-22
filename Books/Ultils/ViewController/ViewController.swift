//
//  ViewController.swift
//  Books
//
//  Created by Igor Fortti on 21/09/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    private func dismissErrorView() {
        dismiss(animated: false, completion: nil)
    }
    
    func displayError(message: String) {
        let error = ErrorView(message: message, dismissAction: dismissErrorView) { action in
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
