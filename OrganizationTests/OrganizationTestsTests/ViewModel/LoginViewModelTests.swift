//
//  LoginViewModelTests.swift
//  OrganizationTestsTests
//
//  Created by Yago Filipe Albino on 25/01/21.
//  Copyright © 2021 Tests. All rights reserved.
//

@testable import OrganizationTests

class LoginViewModelTests: BaseTests, BaseViewModelTests {
    
    // MARK: - Associated type
    
    typealias ViewModel = LoginViewModelProtocol
    typealias ViewModelMock = LoginViewModelMock
    
    // MARK: - Properties
    
    var viewModel: LoginViewModelProtocol?
    var mock: LoginViewModelMock = LoginViewModelMock()
    var isSuccess = false
    
    // MARK: - Tests
    
    func test_UT_validateInitViewModel() {
        given() {
            viewModel = mock.makeViewModel()
        }
        
        then {
            assert(.notNil, viewModel)
        }
    }
    
    func test_UT_DoLoginWithNilLoginAndPassword() {
        given {
            viewModel = mock.makeViewModel()
            viewModel?.openNewScreen = openNewScreen
        }
        
        when {
            viewModel?.doLogin(login: nil, password: nil)
        }
        
        then {
            assert(.equal, viewModel?.errors.value, "Login ou senha incorretos")
            assert(.equal, isSuccess, false)
        }
    }
    
    func test_UT_DoLoginWithEmptyLoginAndPassword() {
        given {
            viewModel = mock.makeViewModel()
            viewModel?.openNewScreen = openNewScreen
        }
        
        when {
            viewModel?.doLogin(login: String(), password: String())
        }
        
        then {
            assert(.equal, viewModel?.errors.value, "Login ou senha incorretos")
            assert(.equal, isSuccess, false)
        }
    }
    
    func test_UT_DoLoginWithIncorrectDataResponse() {
        given {
            viewModel = mock.makeViewModel()
            viewModel?.openNewScreen = openNewScreen
        }
        
        when {
            viewModel?.doLogin(login: "1234567890", password: "123")
        }
        
        then {
            assert(.equal, viewModel?.errors.value, "Login ou senha incorretos")
            assert(.equal, isSuccess, false)
        }
    }
    
    func test_UT_DoLoginWithNotFoundResponse() {
        given {
            viewModel = mock.makeViewModel()
            viewModel?.openNewScreen = openNewScreen
        }
        
        when {
            viewModel?.doLogin(login: "123456789", password: "1234")
        }
        
        then {
            assert(.equal, viewModel?.errors.value, "Usuário não encontrado")
            assert(.equal, isSuccess, false)
        }
    }
    
    func test_UT_DoLoginWithSuccessResponse() {
        given {
            viewModel = mock.makeViewModel()
            viewModel?.openNewScreen = openNewScreen
        }
        
        when {
            viewModel?.doLogin(login: "1234567890", password: "1234")
        }
        
        then {
            assert(.equal, isSuccess, true)
        }
    }
    
    // MARK: - Private functions
    
    private func openNewScreen() {
        isSuccess = true
    }
}
