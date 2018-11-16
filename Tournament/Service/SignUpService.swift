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
    
    @discardableResult class func createUser(withEmail email: String, password: String) -> Single<User> {
        return Single<User>.create(subscribe: { (single) -> Disposable in
            Auth.auth().createUser(withEmail: email, password: password, completion: { (result, error) in
                if let user = result?.user {
                    single(.success(user))
                }
                else if let error = error {
                    single(.error(error))
                }
            })
            
            return Disposables.create()
        })
    }
}
