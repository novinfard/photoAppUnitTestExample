//
//  SignupError.swift
//  PhotoApp
//
//  Created by Soheil  Novinfard on 16/07/2021.
//  Copyright © 2021 Novinfard. All rights reserved.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    case responseParseError
    case invalidUrl
    case failedRequest(description: String)

    var errorDescription: String? {
        switch self {

        case .responseParseError:
            return nil
        case .invalidUrl:
            return nil
        case .failedRequest(description: let description):
            return description
        }
    }
}
