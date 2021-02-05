//
//  BaseTests.swift
//  OrganizationTestsTests
//
//  Created by Yago Filipe Albino on 29/06/20.
//  Copyright © 2020 Tests. All rights reserved.
//

import XCTest

/// Equality enum
public enum Equality {
    case equal
    case notEqual
}

/// Nullability enum
public enum Nullability {
    case `nil`
    case notNil
}

/// Comparability enum
public enum Comparability {
    case greaterThan
    case lessThan
    case greaterThanOrEqual
    case lessThanOrEqual
}

/// Booleanability enum
public enum Booleanability {
    case `true`
    case `false`
}

open class BaseTests: XCTestCase {
    
    // MARK: - Private properties
    
    private var givenDescription: String = String()
    private var whenDescription: String = String()
    private var thenDescription: String = String()
    
    // MARK: - Properties
    
    private var given: (() -> Void)? = nil
    private var when: (() -> Void)? = nil
    private var then: (() -> Void)? = nil
    
    // MARK: - Overrides
    
    override open func tearDown() {
        given = nil
        when = nil
        then = nil
    }
    
    // MARK: - Test methods
    
    /// Method responsible to configure values necessary to your test
    /// - Parameter given: configure values
    public func given(_ description: String = String(), _ given: () -> Void) {
        XCTContext.runActivity(named: description) { _ in
            given()
        }
    }
    
    /// Method responsible to execute the code that will be tested
    /// - Parameter when: executed code
    public func when(_ description: String = String(), _ when: () -> Void) {
        XCTContext.runActivity(named: description) { _ in
            when()
        }
    }
    
    /// Method responsible to assert expected values
    /// - Parameter then: expected values
    public func then(_ description: String = String(), _ then: () -> Void) {
        XCTContext.runActivity(named: description) { _ in
            then()
        }
    }
    
    // MARK: - Wait methods
    
    /// Wait for some seconds
    /// - Parameters:
    ///   - duration: time to wait
    ///   - description: wait description
    ///   - then: execute after time finish [optional]
    public func wait(for duration: TimeInterval, withDescription description: String, then: @escaping () -> Void) {
        let waitExpectation = expectation(description: description)
        let dispatchTime: DispatchTime = .now() + duration
        
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            waitExpectation.fulfill()
            then()
        }
        
        wait(for: [waitExpectation], timeout: duration)
    }
    
    // MARK: - Assertions methods
    
    /// Default assertion
    /// - Parameters:
    ///   - expression: expression
    ///   - message: message if fail
    public func assert(_ expression: @autoclosure () throws -> Bool, message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
        XCTAssert(try expression())
    }
    
    /// Equality assertion
    /// - Parameters:
    ///   - equality: type
    ///   - exp1: expression 1
    ///   - exp2: expression 2
    ///   - message: message if fail
    public func assert<T>(_ equality: Equality, _ exp1: @autoclosure () throws -> T, _ exp2: @autoclosure () throws -> T, message: String = String(), file: StaticString = #file, line: UInt = #line) where T: Equatable {
        if equality == .equal {
            XCTAssertEqual(try exp1(), try exp2(), message, file: file, line: line)
        } else {
            XCTAssertNotEqual(try exp1(), try exp2(), message, file: file, line: line)
        }
    }
    
    /// Nullability assertion
    /// - Parameters:
    ///   - nullability: type
    ///   - exp: expression
    ///   - message: message if fail
    public func assert(_ nullability: Nullability, _ exp: @autoclosure () throws -> Any?, message: String = String(), file: StaticString = #file, line: UInt = #line) {
        if nullability == .nil {
            XCTAssertNil(try exp(), message, file: file, line: line)
        } else {
            XCTAssertNotNil(try exp(), message, file: file, line: line)
        }
    }
    
    /// Comparability assertion
    /// - Parameters:
    ///   - comparability: type
    ///   - exp1: expression 1
    ///   - exp2: expression 2
    ///   - message: message if fail
    public func assert<T>(_ comparability: Comparability, _ exp1: @autoclosure () throws -> T, _ exp2: @autoclosure () throws -> T, message: String = String(), file: StaticString = #file, line: UInt = #line) where T : Comparable {
        switch comparability {
        case .greaterThan:
            XCTAssertGreaterThan(try exp1(), try exp2(), message, file: file, line: line)
        case .greaterThanOrEqual:
            XCTAssertGreaterThanOrEqual(try exp1(), try exp2(), message, file: file, line: line)
        case .lessThan:
            XCTAssertLessThan(try exp1(), try exp2(), message, file: file, line: line)
        case .lessThanOrEqual:
            XCTAssertLessThanOrEqual(try exp1(), try exp2(), message, file: file, line: line)
        }
    }
    
    /// Booleanability assertion
    /// - Parameters:
    ///   - booleanability: type
    ///   - exp: expression
    ///   - message: message if fail
    public func assert(_ booleanability: Booleanability,_ exp: @autoclosure () throws -> Bool, message: String = String(), file: StaticString = #file, line: UInt = #line) {
        if booleanability == .true {
            XCTAssertTrue(try exp(), message)
        } else {
            XCTAssertFalse(try exp(), message)
        }
    }
    
    /// Fail assertion
    /// - Parameters:
    ///   - message: message
    public func fail(message: String = String(), file: StaticString = #file, line: UInt = #line) {
        XCTFail(message, file: file, line: line)
    }
}
