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

    func test_whenFirstNameIsTooShort_shouldReturnFalse() {
        // Given
        let sut = SignupFormModelValidator()

        // When
        let valid = sut.isFirstNameValid(firstName: "S")

        // Then
        XCTAssertFalse(valid, "The firstName is too short, so `isFirstNameValid` should return FALSE")
    }

    func test_whenFirstNameIsTooLong_shouldReturnFalse() {
        // Given
        let sut = SignupFormModelValidator()

        // When
        let valid = sut.isFirstNameValid(firstName: "Samuel Andy Robin")

        // Then
        XCTAssertFalse(valid, "The firstName is too short, so `isFirstNameValid` should return FALSE")
    }

    func test_whenPasswordsIsTooShort_shouldReturnFalse() {
        // Given
        let sut = SignupFormModelValidator()

        // When
        let valid = sut.isPasswordValid(password: "aas")

        // Then
        XCTAssertFalse(valid, "The password is too short, so `isPasswordValid` should return FALSE")
    }

    func test_whenPasswordIsTooLong_shouldReturnFalse() {
        // Given
        let sut = SignupFormModelValidator()

        // When
        let valid = sut.isPasswordValid(password: "Samuel Andy Robin Andy Robin Andy Robin Andy Robin")

        // Then
        XCTAssertFalse(valid, "The password is too long, so `isFirstNameValid` should return FALSE")
    }

    func test_whenEqualPasswordProvided_shouldReturnTrue() {
        // Arrange
        let sut = SignupFormModelValidator()

        // Act
        let doPassMatch = sut.doPasswordsMatch(password: "123123", repeatPassword: "123123")

        // Assert
        XCTAssertTrue(doPassMatch, "The passwords are the same, so it should return `True`")
    }

    func test_whenDifferentPasswordProvided_shouldReturnFalse() {
        // Arrange
        let sut = SignupFormModelValidator()

        // Act
        let doPassMatch = sut.doPasswordsMatch(password: "123123", repeatPassword: "1010")

        // Assert
        XCTAssertFalse(doPassMatch,  "The passwords are different, so it should return `False`")
    }


}
