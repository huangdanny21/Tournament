//
//  SignUpViewModel.swift
//  Tournament
//
//  Created by Danny on 11/16/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Firebase

struct SignUpViewModel {
    struct Inputs {
        let signUpTapped: Observable<Void>
        let loginTapped: Observable<Void>
        let usernameText: Observable<String>
        let emailText: Observable<String>
        let passwordText: Observable<String>
    }
    
    // MARK: - Ouputs
    
    let errorMessage: Driver<String>
    //let userCreated: Driver<User>
}

extension SignUpViewModel {
    init(_ inputs: Inputs) {
        let credentials = Observable.combineLatest(inputs.usernameText, inputs.emailText, inputs.passwordText)
        
        let clientSideError = inputs.signUpTapped
            .withLatestFrom(credentials)
            .map { (result: SignUpCredentials) -> String in
                if result.username.isEmpty {
                    return SignUpError.invalidUsername.localizedDescription
                }
                else if result.email.isEmpty {
                    return SignUpError.invalidEmail.localizedDescription
                }
                else if result.password.isEmpty {
                    return SignUpError.invalidPassword.localizedDescription
                }
                return ""
        }
        
        let isUsernameAvailable = inputs.signUpTapped
            .withLatestFrom(clientSideError)
            .filter{$0.isEmpty}
            .withLatestFrom(inputs.usernameText)
            .flatMapLatest{SignUpService.isUsernameTaken($0)}
            .share()
        
        let usernameUnavailableError = isUsernameAvailable
            .filter{$0}
            .map{_ in SignUpError.usernameTaken.localizedDescription}
        
        errorMessage = Observable.merge(clientSideError, usernameUnavailableError)
            .filter{!$0.isEmpty}
            .asDriverLogError()
        
    }
}


typealias SignUpCredentials = (username: String, email: String, password: String)
