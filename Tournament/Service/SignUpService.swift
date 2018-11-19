//
//  SignUpService.swift
//  Tournament
//
//  Created by Danny on 11/15/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import RxSwift
import Alamofire
import Firebase

class SignUpService {
    @discardableResult class func isUsernameTaken(_ username: String) -> Observable<Result<Bool>> {
        return Observable.create({ (observer) -> Disposable in
            let docRef = Firestore.firestore().collection("users").document(username)
            docRef.getDocument(completion: { (document, error) in
                if let document = document, document.exists {
                    observer.onNext(.success(true))
                    observer.onCompleted()
                } else {
                    observer.onNext(.success(false))
                    observer.onCompleted()
                }
            })
            
            return Disposables.create()
        })
        .trackActivity(firestoreNetworkActivity)
    }
    
    @discardableResult class func createUser(withEmail email: String, password: String) -> Observable<Result<User>> {
        return Observable.create({ (observer) -> Disposable in
            Auth.auth().createUser(withEmail: email, password: password, completion: { (result, error) in
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
