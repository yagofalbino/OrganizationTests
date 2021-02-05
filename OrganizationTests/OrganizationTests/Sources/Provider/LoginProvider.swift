//
//  LoginProvider.swift
//  OrganizationTests
//
//  Created by Yago Filipe Albino on 25/01/21.
//  Copyright © 2021 Tests. All rights reserved.
//

import Foundation

class LoginProvider {
    
    // MARK: - Functions
    
    func doLogin(login: String?, password: String?, completion: @escaping (_ result: LoginErrors) -> Void) {
        guard let login = login, let password = password else {
            completion(.incorrectData)
            return
        }
        
        if login.isEmpty || password.isEmpty {
            completion(.incorrectData)
            return
        }
        
        if login == "1234567890" {
            if password == "1234" {
                completion(.success)
                return
            }
            
            completion(.incorrectData)
            return
        }
        
        completion(.notFound)
    }
}
