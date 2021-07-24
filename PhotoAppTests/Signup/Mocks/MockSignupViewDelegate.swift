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
    func successfulSignup() {
        expectation?.fulfill()
    }

    func errorHandler(error: SignupError) {

    }

}
