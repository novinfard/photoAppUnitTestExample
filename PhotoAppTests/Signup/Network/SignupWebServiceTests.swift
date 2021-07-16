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
        // Given
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)

        // When
        let sut = SignupWebService(
            urlString: SignupConstants.signupUrlString,
            urlSession: urlSession
        )
        let signupFormRequestModel = SignupFormRequestModel(
            firstName: "Ahmad",
            lastName: "Farahani",
            email: "test@test.com",
            password: "123123"
        )

        let exp = expectation(description: "Signup Service Response Expectation")
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            // Then
            XCTAssertEqual(signupResponseModel?.status, "ok")
            exp.fulfill()
        }

        wait(for: [exp], timeout: 10)
    }

   
}