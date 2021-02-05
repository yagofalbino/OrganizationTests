//
//  LoginViewModelProtocol.swift
//  OrganizationTests
//
//  Created by Yago Filipe Albino on 25/01/21.
//  Copyright © 2021 Tests. All rights reserved.
//

import Foundation

protocol LoginViewModelProtocol {
    
    // MARK: - Properties
    
    var welcome: String { get }
    var errors: Dynamic<String> { get }
    var openNewScreen: (() -> Void)? { get set }
    
    // MARK: - Functions
    
    func doLogin(login: String?, password: String?)
}
