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

class SignUpViewModel {
    
    private let didSignUpSubject = PublishSubject<User>()
    private let signUpErrorSubject = PublishSubject<String>()

    let didSignUp: Observable<User>
    let signUpError: Observable<String>
    let activityIndicator = ActivityIndicator()
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Constructor
    
    init() {
        didSignUp = didSignUpSubject.asObservable()
        signUpError = signUpErrorSubject.asObservable()
    }
    
    // MARK: - API
    
    func signUp(withEmail email: String?, password: String?, confirmPassword: String?) {
        guard let email = email, !email.isEmpty else {
            signUpErrorSubject.onNext("Please enter email")
            return
        }
        guard let password = password, !password.isEmpty else {
            signUpErrorSubject.onNext("Please enter password")
            return
        }
        guard let confirmPassword = confirmPassword, !confirmPassword.isEmpty  else {
            signUpErrorSubject.onNext("Please confirm password")
            return
        }
        guard password == confirmPassword else {
            signUpErrorSubject.onNext("Please make sure your password and confirm password match")
            return
        }
        signUp(withEmail: email, password: password)
    }
    
    private func signUp(withEmail email: String, password: String) {
        SignUpService
            .createUser(withEmail: email, password: password)
            .trackActivity(activityIndicator)
            .subscribe(onNext: { [weak self](user) in
                self?.didSignUpSubject.onNext(user)
            }, onError: { (error) in
                self.signUpErrorSubject.onNext(error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }
}
