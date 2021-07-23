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
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var sut: SignupPresenter!

    override func setUpWithError() throws {

        self.signupFormModel = SignupFormModel(
            firstName: "Ahmad",
            lastName: "Farahani",
            email: "test@test.com",
            password: "123123123",
            rePassword: "123123123"
        )

        self.mockSignupModelValidator = MockSignupModelValidator()
        self.mockSignupWebService = MockSignupWebService()

        self.sut = SignupPresenter(
            signupModelValidator: mockSignupModelValidator,
            signupWebService: mockSignupWebService
        )
    }

    override func tearDownWithError() throws {
        self.signupFormModel = nil
        self.mockSignupModelValidator = nil
        self.mockSignupWebService = nil
        self.sut = nil
    }

    func test_whenInformationProvided_willValidateEachProperty() {
        sut.processUserSignup(formModel: signupFormModel)

        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated)
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated)
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated)
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated)
        XCTAssertTrue(mockSignupModelValidator.doPasswordsMatched)
    }

    func test_whenGivenValidFormModel_shouldCallSignupModel() {
        sut.processUserSignup(formModel: signupFormModel)

        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled)
    }

}
