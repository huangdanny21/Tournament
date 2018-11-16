//
//  SignUpViewModel.swift
//  Tournament
//
//  Created by Danny on 11/14/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation
import RxSwift
import RxSwiftUtilities
import Firebase

typealias UserResult = (user: User?, error: Error?)

class SignUpViewModel {
    
    private let signUpSubject = PublishSubject<UserResult>()

    let signUp: Observable<UserResult>
    let activityIndicator = ActivityIndicator()
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Constructor
    
    init() {
        signUp = signUpSubject.observeOn(MainScheduler.instance)
    }
    
    // MARK: - API
    
    func signUp(withUsername username: String?, email: String?, password: String?, confirmPassword: String?) {
        guard let username = username, !username.isEmpty else {
            signUpSubject.onError(SignUpError.invalidUsername)
            return
        }
        guard let email = email, !email.isEmpty else {
            signUpSubject.onError(SignUpError.invalidEmail)
            return
        }
        guard let password = password, !password.isEmpty else {
            signUpSubject.onError(SignUpError.invalidPassword)
            return
        }
        guard password == confirmPassword else {
            signUpSubject.onError(SignUpError.passwordDoesNotMatch)
            return
        }
        signUp(withUsername: username, email: email, password: password)
    }
    
    private func signUp(withUsername username: String, email: String, password: String) {
         SignUpService
            .isUsernameTaken(username)
            .flatMapLatest({ (isTaken) -> Observable<UserResult> in
                if isTaken {
                    return Observable<UserResult>.just((nil, SignUpError.usernameTaken))
                }
                return SignUpService.createUser(withEmail: email, password: password)
            })
            .bind(to: signUpSubject)
            .disposed(by: disposeBag)
    }
}
