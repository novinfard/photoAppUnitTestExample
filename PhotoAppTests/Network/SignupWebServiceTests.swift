//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Soheil  Novinfard on 16/07/2021.
//  Copyright © 2021 Novinfard. All rights reserved.
//

import XCTest
@testable import PhotoApp

class SignupWebServiceTests: XCTestCase {

    func test_whenReceiveSuccessfulResponse_returnsSuccess() {
        let sut = SignupWebService()
        let signupFormRequestModel = SignupFormRequestModel(
            firstName: "Ahmad",
            lastName: "Farahani",
            email: "test@test.com",
            password: "123123"
        )

        let exp = expectation(description: "Signup Service Response Expectation")
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            XCTAssertEqual(signupResponseModel?.status, "ok")
            exp.fulfill()
        }

        wait(for: [exp], timeout: 3)
    }

   
}
