//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Soheil  Novinfard on 23/07/2021.
//  Copyright © 2021 Novinfard. All rights reserved.
//

import Foundation

class SignupPresenter {
    private let signupModelValidator: SignupModelValidatorProtocol
    init(signupModelValidator: SignupModelValidatorProtocol) {
        self.signupModelValidator = signupModelValidator
    }

    func processUserSignup(formModel: SignupFormModel) {
        if !signupModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            return
        }

        if !signupModelValidator.isLastNameValid(lastName: formModel.lastName) {
            return
        }


        if !signupModelValidator.isEmailValid(email: formModel.email) {
            return
        }

        if !signupModelValidator.isPasswordValid(password: formModel.password) {
            return
        }

        if !signupModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.rePassword) {
            return
        }
    }
}
