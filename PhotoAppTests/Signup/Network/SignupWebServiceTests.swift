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

    private var urlSession: URLSession!
    private var sut: SignupWebService!
    private var signupFormRequestModel: SignupFormRequestModel!

    override func setUp() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        self.urlSession = URLSession(configuration: config)

        self.sut = SignupWebService(
            urlString: SignupConstants.signupUrlString,
            urlSession: urlSession
        )

        self.signupFormRequestModel = SignupFormRequestModel(
            firstName: "Ahmad",
            lastName: "Farahani",
            email: "test@test.com",
            password: "123123"
        )
    }

    override func tearDown() {
        urlSession = nil
        MockURLProtocol.stubResponseData = nil
        signupFormRequestModel = nil
    }

    func test_whenReceivedSuccessfulResponse_returnsSuccess() {
        // Given
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)

        // When
        let exp = expectation(description: "Signup Service Response Expectation")
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            // Then
            XCTAssertEqual(signupResponseModel?.status, "ok")
            exp.fulfill()
        }

        wait(for: [exp], timeout: 10)
    }

    func test_whenReceivedIncorrectJsonFormatInResponse_raiseError() {
        // Given
        let jsonString = "{\"path\":\"users\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)

        // When
        let exp = expectation(description: "Signup Service with different response expectation ")
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            // Then
            XCTAssertNil(signupResponseModel)
            XCTAssertEqual(error, .responseParseError)
            exp.fulfill()
        }

        wait(for: [exp], timeout: 10)
    }

   
}
