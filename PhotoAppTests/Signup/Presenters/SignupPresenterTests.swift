//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Soheil  Novinfard on 23/07/2021.
//  Copyright © 2021 Novinfard. All rights reserved.
//

import XCTest
@testable import PhotoApp

class SignupPresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_whenInformationProvided_willValidateEachProperty() {
        let signupFormModel = SignupFormModel(
            firstName: "Ahmad",
            lastName: "Farahani",
            email: "test@test.com",
            password: "123123123",
            rePassword: "123123123"
        )

        let mockSignupModelValidator = MockSignupModelValidator()
        let mockSignupWebService = MockSignupWebService()

        let sut = SignupPresenter(
            signupModelValidator: mockSignupModelValidator,
            signupWebService: mockSignupWebService
        )
        sut.processUserSignup(formModel: signupFormModel)

        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated)
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated)
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated)
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated)
        XCTAssertTrue(mockSignupModelValidator.doPasswordsMatched)
    }

    func test_whenGivenValidFormModel_shouldCallSignupModel() {
        let signupFormModel = SignupFormModel(
            firstName: "Ahmad",
            lastName: "Farahani",
            email: "test@test.com",
            password: "123123123",
            rePassword: "123123123"
        )

        let mockSignupModelValidator = MockSignupModelValidator()
        let mockSignupWebService = MockSignupWebService()

        let sut = SignupPresenter(
            signupModelValidator: mockSignupModelValidator,
            signupWebService: mockSignupWebService
        )
        sut.processUserSignup(formModel: signupFormModel)

        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled)
    }

}
