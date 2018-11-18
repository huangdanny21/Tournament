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
    @discardableResult class func isUsernameTaken(_ username: String) -> Observable<Bool> {
        return Observable.create({ (observer) -> Disposable in
            let docRef = Firestore.firestore().collection("users").document(username)
            docRef.getDocument(completion: { (document, error) in
                if let document = document, document.exists {
                    observer.onNext(true)
                } else {
                    observer.onNext(false)
                }
            })
            
            return Disposables.create()
        })
    }
    
    @discardableResult class func createUser(withEmail email: String, password: String) -> Observable<User> {
        return Observable.create({ (observer) -> Disposable in
            Auth.auth().createUser(withEmail: email, password: password, completion: { (result, error) in

                if let user = result?.user {
                    observer.onNext((user))
                }
                else if let error = error {
                    observer.onError(error)
                }
            })
            return Disposables.create()
        })
    }
}
