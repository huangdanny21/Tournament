//
//  LoginViewModel.swift
//  Tournament
//
//  Created by Danny on 11/15/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import RxSwift
import RxCocoa
import RxSwiftUtilities
import Alamofire
import Firebase

struct LoginViewModel {
    struct Inputs {
        let loginTapped: Observable<Void>
        let emailText: Observable<String>
        let passwordText: Observable<String>
    }
    
    // MARK: - Outputs
    
    let errorMessage: Driver<String>
    let loggedIn: Driver<User>
}

extension LoginViewModel {
    init(_ inputs: Inputs) {
        let credentials = Observable.combineLatest(inputs.emailText, inputs.passwordText)
        
        let clientSideError = inputs.loginTapped
            .withLatestFrom(credentials)
            .map { (result) -> String in
                if result.0.isEmpty {
                    return SignUpError.invalidEmail.localizedDescription
                }
                else if result.1.isEmpty {
                    return SignUpError.invalidPassword.localizedDescription
                }
                return ""
        }
        
        let login = inputs.loginTapped
            .withLatestFrom(clientSideError)
            .filter{$0.isEmpty}
            .withLatestFrom(credentials)
            .flatMap{LoginService.login(withEmail: $0, password: $1)}
            .share()
        
        let serverError = login
            .filter{$0.isFailure}
            .map{$0.error?.localizedDescription ?? ""}

        errorMessage = Observable.merge(clientSideError, serverError)
            .filter{!$0.isEmpty}
            .asDriverLogError()
        
        loggedIn = login
            .filter{$0.isSuccess}
            .map{ $0.value}
            .unwrap()
            .asDriverLogError()
        
    }
}
