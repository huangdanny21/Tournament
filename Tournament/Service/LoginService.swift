//
//  LoginService.swift
//  Tournament
//
//  Created by Danny on 11/15/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import RxSwift
import Firebase
import Alamofire

class LoginService {
    @discardableResult class func login(withEmail email: String, password: String) -> Observable<Result<User>> {
        return Observable.create({ (observer) -> Disposable in
            Auth.auth().signIn(withEmail: email, password: password, completion: { (result, error) in
                if let user = result?.user {
                    observer.onNext(.success(user))
                    observer.onCompleted()
                }
                else if let error = error {
                    observer.onNext(.failure(error))
                    observer.onCompleted()
                }
            })

            return Disposables.create()
        })
        .trackActivity(firestoreNetworkActivity)
    }
}
