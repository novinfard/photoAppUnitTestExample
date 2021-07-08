//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by Soheil  Novinfard on 08/07/2021.
//  Copyright © 2021 Novinfard. All rights reserved.
//

import Foundation

class SignupFormModelValidator {
    func isFirstNameValid(firstName: String) -> Bool {
        if firstName.isEmpty {
            return false
        }

        if firstName.count < 3 {
            return false
        }

        return true
    }
}
