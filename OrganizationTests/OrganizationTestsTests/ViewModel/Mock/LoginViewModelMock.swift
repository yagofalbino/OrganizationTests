//
//  LoginViewModelMock.swift
//  OrganizationTestsTests
//
//  Created by Yago Filipe Albino on 25/01/21.
//  Copyright © 2021 Tests. All rights reserved.
//

@testable import OrganizationTests

class LoginViewModelMock {
    
    // MARK: - Functions
    
    func makeViewModel() -> LoginViewModelProtocol {
        return LoginViewModel()
    }
}
