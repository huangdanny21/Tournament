//
//  SignUpViewModel.swift
//  Tournament
//
//  Created by Danny on 11/16/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import RxSwift
import RxCocoa
import Alamofire
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
    let userCreated: Driver<(String, User)>
    let toLogin: Driver<Void>
}

extension SignUpViewModel {
    init(_ inputs: Inputs) {
        let credentials = Observable.combineLatest(inputs.usernameText, inputs.emailText, inputs.passwordText)
        let emailAndPassword = Observable.combineLatest(inputs.emailText, inputs.passwordText)
        
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
        
        let isUsernameTaken = inputs.signUpTapped
            .withLatestFrom(clientSideError)
            .filter{$0.isEmpty}
            .withLatestFrom(inputs.usernameText)
            .flatMapLatest{SignUpService.isUsernameTaken($0)}
            .share()
        
        let usernameUnavailableError = isUsernameTaken
            .filter{$0.isSuccess && $0.value == true}
            .map{_ in SignUpError.usernameTaken.localizedDescription}

        let createUser = isUsernameTaken
            .filter {$0.isSuccess && $0.value == false}
            .withLatestFrom(emailAndPassword)
            .flatMapLatest{SignUpService.createUser(withEmail: $0, password: $1)}
            .share()
        
        let serverError = createUser
            .filter{$0.isFailure}
            .map{$0.error?.localizedDescription ?? ""}

        let user = createUser
            .filter{$0.isSuccess}
            .map{$0.value}
            .unwrap()
        
        errorMessage = Observable.merge(clientSideError, usernameUnavailableError, serverError)
            .filter{!$0.isEmpty}
            .asDriverLogError()
        
        userCreated = Observable.combineLatest(inputs.usernameText, user)
            .map{($0, $1)}
            .asDriverLogError()
        
        toLogin = inputs.loginTapped
            .asDriverLogError()
        
    }
}

typealias SignUpCredentials = (username: String, email: String, password: String)
