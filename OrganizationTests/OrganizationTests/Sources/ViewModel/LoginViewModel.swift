//
//  LoginViewModel.swift
//  OrganizationTests
//
//  Created by Yago Filipe Albino on 25/01/21.
//  Copyright © 2021 Tests. All rights reserved.
//

import Foundation

class LoginViewModel: LoginViewModelProtocol {
    
    // MARK: - Private properties
    
    private lazy var loginManager: LoginManagerProtocol = LoginManager()
    
    // MARK: - Properties
    
    var welcome: String = "Bem vindo !"
    var errors = Dynamic<String>(String())
    var openNewScreen: (() -> Void)?
    
    // MARK: - Functions
    
    func doLogin(login: String?, password: String?) {
        loginManager.doLogin(login: login, password: password) { result in
            switch result {
            case .incorrectData, .notFound:
                self.errors.value = result.rawValue
            case .success:
                self.openNewScreen?()
            }
        }
    }
}
