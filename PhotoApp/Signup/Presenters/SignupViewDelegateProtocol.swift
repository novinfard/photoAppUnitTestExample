//
//  SignupViewDelegateProtocol.swift
//  PhotoApp
//
//  Created by Soheil  Novinfard on 24/07/2021.
//  Copyright © 2021 Novinfard. All rights reserved.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfulSignup()
    func errorHandler(error: SignupError)
}
