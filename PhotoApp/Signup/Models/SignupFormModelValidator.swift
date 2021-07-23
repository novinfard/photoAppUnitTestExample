//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by Soheil  Novinfard on 08/07/2021.
//  Copyright © 2021 Novinfard. All rights reserved.
//

import Foundation

class SignupFormModelValidator: SignupModelValidatorProtocol {
    func isFirstNameValid(firstName: String) -> Bool {
        if firstName.isEmpty {
            return false
        }

        if firstName.count < SignupConstants.minFirstNameLength
            || firstName.count > SignupConstants.maxFirstNameLength {
            return false
        }

        return true
    }

    func isLastNameValid(lastName: String) -> Bool {
        if lastName.isEmpty {
            return false
        }

        if lastName.count < SignupConstants.minFirstNameLength
            || lastName.count > SignupConstants.maxFirstNameLength {
            return false
        }

        return true
    }

    func isEmailValid(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    func isPasswordValid(password: String) -> Bool {
        if password.count < SignupConstants.passwordMinLength
            || password.count > SignupConstants.passwordMaxLength {
            return false
        }
        return true
    }

    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        return password == repeatPassword
    }
}
