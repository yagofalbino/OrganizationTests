//
//  BaseViewModelTests.swift
//  OrganizationTestsTests
//
//  Created by Yago Filipe Albino on 29/06/20.
//  Copyright © 2020 Tests. All rights reserved.
//

public protocol BaseViewModelTests {
    
    // MARK: - Associated type
    
    associatedtype ViewModel
    associatedtype ViewModelMock
    
    // MARK: - Properties
    
    /// View model that will be tested
    var viewModel: ViewModel? { get set }
    
    /// Mock for view model
    var mock: ViewModelMock { get set }
}
