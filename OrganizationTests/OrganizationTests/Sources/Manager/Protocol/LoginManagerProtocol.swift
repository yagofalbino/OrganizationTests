//
//  LoginManagerProtocol.swift
//  OrganizationTests
//
//  Created by Yago Filipe Albino on 25/01/21.
//  Copyright © 2021 Tests. All rights reserved.
//

import Foundation

protocol LoginManagerProtocol {
    
    // MARK: - Functions
    
    func doLogin(login: String?, password: String?, completion: @escaping (_ result: LoginErrors) -> Void)
}
