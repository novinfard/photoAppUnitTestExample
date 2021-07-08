//
//  SignupFormModelValidatorTests.swift
//  PhotoAppTests
//
//  Created by Soheil Novinfard on 08/07/2021.
//  Copyright © 2021 Novinfard. All rights reserved.
//

import XCTest
@testable import PhotoApp

class SignupFormModelValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_whenValidFirstNameProvided_shouldReturnTrue() {
        // Arrange
        let sut = SignupFormModelValidator()

        // Act
        let valid = sut.isFirstNameValid(firstName: "Soheil")

        // Assert
        XCTAssertTrue(valid, "The firstName is not valid, so `isFirstNameValid` returned FALSE instead")
    }

}
