//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by Soheil  Novinfard on 16/07/2021.
//  Copyright © 2021 Novinfard. All rights reserved.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
