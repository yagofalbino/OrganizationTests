//
//  LoginManager.swift
//  OrganizationTests
//
//  Created by Yago Filipe Albino on 25/01/21.
//  Copyright © 2021 Tests. All rights reserved.
//

import Foundation

enum LoginErrors: String {
    case notFound = "Usuário não encontrado"
    case incorrectData = "Login ou senha incorretos"
    case success
}

class LoginManager: LoginManagerProtocol {
    
    // MARK: - Private properties
    
    private lazy var loginProvider = LoginProvider()
    
    // MARK: - Functions
    
    func doLogin(login: String?, password: String?, completion: @escaping (_ result: LoginErrors) -> Void) {
        loginProvider.doLogin(login: login, password: password, completion: completion)
    }
}
