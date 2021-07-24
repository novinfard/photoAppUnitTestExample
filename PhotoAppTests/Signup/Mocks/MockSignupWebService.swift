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
    var shouldReturnError: Bool = false

    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        isSignupMethodCalled = true

        if shouldReturnError {
            completionHandler(nil, SignupError.failedRequest(description: "Signup not successful"))
        } else {
            let responseModel = SignupResponseModel(status: "OK")
            completionHandler(responseModel, nil)
        }
    }
}
