//
//  LoginInteractorTests.swift
//  TesteSantander
//
//  Created by Rodrigo Martins on 23/05/2019.
//  Copyright (c) 2019 Rodrigo Martins. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import TesteSantander
import XCTest

class LoginInteractorTests: XCTestCase{
    var sut: LoginInteractor!
    var loginProperties: (cpf: String, email: String, password: String) = ("59191554853", "martins@test.com.br", "R@123quatro")
    
    override func setUp() {
        super.setUp()
        setupLoginInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func setupLoginInteractor() {
        sut = LoginInteractor()
    }

    func testEmptyLoginTextFields() {
        XCTAssertFalse(sut.valuesNotEmpty(user: "", password: ""), "Os TextField estão vazios e o resultado será false")
    }
    

    func testTestUserLoginType() {
        XCTAssert(sut.isValidateUser(user: loginProperties.cpf), "CPF Valido")
        XCTAssert(sut.isValidateUser(user: loginProperties.email), "E-Mail Vlido")
    }
    
    func testPasswordIsValid() {
        let testResult = sut.isValidatePassword(password: loginProperties.password)
        
        XCTAssertTrue(testResult, "A senha corresponde a todos os requisitos")
    }
}
