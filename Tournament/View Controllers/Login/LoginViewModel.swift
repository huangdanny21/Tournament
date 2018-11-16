//
//  LoginViewModel.swift
//  Tournament
//
//  Created by Danny on 11/15/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation
import RxSwift
import RxSwiftUtilities
import Firebase

class LoginViewModel {
    private let didLoginSubject = PublishSubject<User>()
    private let loginErrorSubject = PublishSubject<String>()
    
    let didLogin: Observable<User>
    let loginError: Observable<String>
    let activityIndicator = ActivityIndicator()
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Constructor
    
    init() {
        didLogin = didLoginSubject.asObservable()
        loginError = loginErrorSubject.asObservable()
    }
    
    // MARK: - API
    
    func login(withEmail email: String?, password: String?) {
        guard let email = email, !email.isEmpty else {
            loginErrorSubject.onNext("Please enter email")
            return
        }
        guard let password = password, !password.isEmpty else {
            loginErrorSubject.onNext("Please enter password")
            return
        }
        login(withEmail: email, password: password)
    }
    
    private func login(withEmail email: String, password: String) {
        LoginService
            .login(withEmail: email, password: password)
            .trackActivity(activityIndicator)
            .asSingle()
            .subscribe(onSuccess: { [weak self](user) in
                self?.didLoginSubject.onNext(user)
            }) { [weak self](error) in
                self?.loginErrorSubject.onNext(error.localizedDescription)
            }
            .disposed(by: disposeBag)
    }
}
