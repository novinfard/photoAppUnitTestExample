//
//  SignupWebService.swift
//  PhotoApp
//
//  Created by Soheil  Novinfard on 16/07/2021.
//  Copyright © 2021 Novinfard. All rights reserved.
//

import Foundation

class SignupWebService: SignupWebServiceProtocol {
    private let urlString: String
    private let urlSession: URLSession

    init(urlString: String,
         urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }

    func signup(withForm formModel: SignupFormRequestModel,
                completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(nil, .invalidUrl)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(formModel)

        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            if let requestError = error {
                completionHandler(nil, SignupError.failedRequest(description: requestError.localizedDescription))
                return
            }

            if let data = data,
               let signupResponseModel = try? JSONDecoder().decode(
                SignupResponseModel.self, from: data
               ) {
                completionHandler(signupResponseModel, nil)
            } else {
                completionHandler(nil, .responseParseError)
            }

        }

        dataTask.resume()
    }
}
