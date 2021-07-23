//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by Soheil  Novinfard on 23/07/2021.
//  Copyright © 2021 Novinfard. All rights reserved.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void)
}
