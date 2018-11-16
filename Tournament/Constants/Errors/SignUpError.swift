//
//  SignUpError.swift
//  Tournament
//
//  Created by Danny on 11/15/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

enum SignUpError: Error {
    case invalidUsername
    case invalidEmail
    case invalidPassword
    case passwordDoesNotMatch
    case usernameTaken
}

extension SignUpError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidUsername:
            return NSLocalizedString("Please enter an username.", comment: "Sign Up Error")
        case .invalidEmail:
            return NSLocalizedString("Please enter an email.", comment: "Sign Up Error")
        case .invalidPassword:
            return NSLocalizedString("Please enter password.", comment: "Sign Up Error")
        case .passwordDoesNotMatch:
            return NSLocalizedString("Please make sure your password and confirm password match", comment: "Sign Up Error")
        case .usernameTaken:
            return NSLocalizedString("This username is taken, please choose another one.", comment: "Sign Up Error")
        }
    }
}
