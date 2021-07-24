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
    private let signupWebService: SignupWebServiceProtocol
    private weak var delegate: SignupViewDelegateProtocol?

    init(signupModelValidator: SignupModelValidatorProtocol,
         signupWebService: SignupWebServiceProtocol,
         delegate: SignupViewDelegateProtocol) {
        self.signupModelValidator = signupModelValidator
        self.signupWebService = signupWebService
        self.delegate = delegate
    }

    func processUserSignup(formModel: SignupFormModel) {
        // Validation
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

        // Submit Form
        let requestModel = SignupFormRequestModel.mapFrom(formModel: formModel)
        signupWebService.signup(withForm: requestModel) { [weak self] responseModel, error in
            if let responseModel = responseModel {
                self?.delegate?.successfulSignup()
            } else if let error = error {
                self?.delegate?.errorHandler(error: error)
            }
        }
    }
}

fileprivate extension SignupFormRequestModel {
    static func mapFrom(formModel: SignupFormModel) -> SignupFormRequestModel {
        return SignupFormRequestModel(
            firstName: formModel.firstName,
            lastName: formModel.lastName,
            email: formModel.email,
            password: formModel.password
        )
    }
}
