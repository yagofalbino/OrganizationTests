//
//  LoginViewController.swift
//  OrganizationTests
//
//  Created by Yago Filipe Albino on 29/06/20.
//  Copyright © 2020 Tests. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Constants
    
    private let newScreenSegue = "NewViewControllerSegue"
    
    // MARK: - Properties
    
    var viewModel: LoginViewModelProtocol = LoginViewModel()
    
    // MARK: - Outlets
    
    @IBOutlet private weak var wellcomeLabel: UILabel?
    @IBOutlet private weak var loginTextField: UITextField?
    @IBOutlet private weak var passwordTextField: UITextField?
    @IBOutlet private weak var errorLabel: UILabel?
    @IBOutlet private weak var loginButton: UIButton?
    
    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        viewModel.openNewScreen = openNewScreen
        viewModel.errors.bind { [weak self] errors in
            guard let self = self else { return }
            self.errorLabel?.text = errors
        }
    }
    
    // MARK: - Private functions
    
    private func openNewScreen() {
        performSegue(withIdentifier: newScreenSegue, sender: self)
    }
    
    // MARK: - Actions
    
    @IBAction private func didTapLoginButton(_ sender: Any) {
        viewModel.doLogin(login: loginTextField?.text, password: passwordTextField?.text)
    }
}
