//
//  SignUpService.swift
//  Tournament
//
//  Created by Danny on 11/15/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import RxSwift
import Firebase

class SignUpService {
    @discardableResult class func createUser(withEmail email: String, password: String) -> Observable<User> {
        return Observable.create({ (observer) -> Disposable in
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if let user = result?.user {
                    observer.onNext(user)
                }
                else if let error = error {
                    observer.onError(error)
                }
            }
            return Disposables.create()
        })
    }
}
