//
//  MockSignupViewDelegate.swift
//  PhotoAppTests
//
//  Created by Soheil  Novinfard on 24/07/2021.
//  Copyright © 2021 Novinfard. All rights reserved.
//

import Foundation
import XCTest
@testable import PhotoApp

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    var expectation: XCTestExpectation?
    var successfulSignupCounter: Int = 0
    var errorSignupCounter: Int = 0
    var signupError: SignupError?

    func successfulSignup() {
        successfulSignupCounter += 1
        expectation?.fulfill()
    }

    func errorHandler(error: SignupError) {
        errorSignupCounter += 1
        signupError = error
        expectation?.fulfill()
    }

}
