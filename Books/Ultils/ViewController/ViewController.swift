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
    }
    
    private func dismissErrorView() {
        dismiss(animated: false, completion: nil)
    }
    
    func displayError() {
        let error = ErrorView(dismissAction: dismissErrorView) { action in
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
