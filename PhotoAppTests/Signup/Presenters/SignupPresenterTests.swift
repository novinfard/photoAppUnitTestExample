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
    var mockSignupViewDelegate: MockSignupViewDelegate!

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
        self.mockSignupViewDelegate = MockSignupViewDelegate()

        self.sut = SignupPresenter(
            signupModelValidator: mockSignupModelValidator,
            signupWebService: mockSignupWebService,
            delegate: mockSignupViewDelegate
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

    func test_whenSignupOperationSuccessful_callsSuccessOnViewDelegate() {
        let expectation = expectation(description: "successfulSignup() should called")

        mockSignupViewDelegate.expectation = expectation
        sut.processUserSignup(formModel: signupFormModel)

        wait(for: [expectation], timeout: 5)

        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCounter, 1, "The signup method should get called only once")
    }

    func test_whenSignupOperationFails_shouldReturnErrorOnViewDelegate() {
        let expectation = expectation(description: "fail on signup operation")

        mockSignupWebService.shouldReturnError = true
        mockSignupViewDelegate.expectation = expectation
        sut.processUserSignup(formModel: signupFormModel)

        wait(for: [expectation], timeout: 5)

        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCounter, 0)
        XCTAssertEqual(mockSignupViewDelegate.errorSignupCounter, 1)
        XCTAssertNotNil(mockSignupViewDelegate.signupError)
    }

}
