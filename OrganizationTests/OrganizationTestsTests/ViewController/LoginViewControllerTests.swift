//
//  LoginViewControllerTests.swift
//  OrganizationTestsTests
//
//  Created by Yago Filipe Albino on 25/01/21.
//  Copyright © 2021 Tests. All rights reserved.
//

@testable import OrganizationTests
import UIKit

class LoginViewControllerTests: BaseTests {
    
    // MARK: - View elements
    
    var loginTextField: UITextField?
    var passwordTextField: UITextField?
    var enterButton: UIButton?
    var errorLabel: UILabel?
    
    // MARK: - Properties
    
    var window = UIWindow()
    var navigationController: UINavigationController?
    var viewController: UIViewController?
    
    // MARK: - Tests
    
    func test_IT_viewController() {
        given {
            configure()
        }
        
        then {
            assert(.notNil, viewController)
        }
    }
    
    func test_IT_emptyLoginAndPassword() {
        given("Instanciando minha controller") {
            configure()
            enterButton = viewController?.view.viewWith(accessibilityIdentifier: "login_enterButton_id") as? UIButton
            errorLabel = viewController?.view.viewWith(accessibilityIdentifier: "login_errorLabel_id") as? UILabel
        }
        
        when("Clicando no botão de entrar") {
            enterButton?.sendActions(for: .touchUpInside)
        }
        
        then("Mensagem de login ou senha incorretos será exibida") {
            assert(.equal, errorLabel?.text, "Login ou senha incorretos")
        }
    }
    
    func test_IT_notFoundLoginOrPassword() {
        given {
            configure()
            enterButton = viewController?.view.viewWith(accessibilityIdentifier: "login_enterButton_id") as? UIButton
            loginTextField = viewController?.view.viewWith(accessibilityIdentifier: "login_loginTextField_id") as? UITextField
            passwordTextField = viewController?.view.viewWith(accessibilityIdentifier: "login_passwordTextField_id") as? UITextField
            errorLabel = viewController?.view.viewWith(accessibilityIdentifier: "login_errorLabel_id") as? UILabel
        }
        
        when {
            loginTextField?.text = "123456789"
            passwordTextField?.text = "1234"
            enterButton?.sendActions(for: .touchUpInside)
        }
        
        then {
            assert(.equal, errorLabel?.text, "Usuário não encontrado")
        }
    }
    
    func test_IT_successLoginAndPassword() {
        given {
            configure()
            enterButton = viewController?.view.viewWith(accessibilityIdentifier: "login_enterButton_id") as? UIButton
            loginTextField = viewController?.view.viewWith(accessibilityIdentifier: "login_loginTextField_id") as? UITextField
            passwordTextField = viewController?.view.viewWith(accessibilityIdentifier: "login_passwordTextField_id") as? UITextField
            errorLabel = viewController?.view.viewWith(accessibilityIdentifier: "login_errorLabel_id") as? UILabel
        }
        
        when {
            loginTextField?.text = "1234567890"
            passwordTextField?.text = "1234"
            enterButton?.sendActions(for: .touchUpInside)
            wait(for: 1.0, withDescription: "wait for screen open") {
                print("")
            }
        }
        
        then {
            wait(for: 1.0, withDescription: "wait for screen open") {
                let viewController = self.navigationController?.viewControllers[1]
                self.assert(.notNil, viewController)
            }
        }
    }
    
    // MARK: - Functions
    
    func configure() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
        
        self.viewController = viewController
        navigationController = UINavigationController(rootViewController: viewController)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
