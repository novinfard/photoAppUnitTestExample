//
//  MockSignupWebService.swift
//  PhotoAppTests
//
//  Created by Soheil  Novinfard on 23/07/2021.
//  Copyright © 2021 Novinfard. All rights reserved.
//

import Foundation
@testable import PhotoApp

class MockSignupWebService: SignupWebServiceProtocol {
    var isSignupMethodCalled: Bool = false

    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        isSignupMethodCalled = true
    }
}
