//
//  CurrentUser.swift
//  Tournament
//
//  Created by Danny on 11/15/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation
import Firebase

class CurrentUser {
    private var user: User?
    private var handle: AuthStateDidChangeListenerHandle?
    static let shared = CurrentUser()

    // MARK: - Constructor
    
    private init() {
        handle = Auth.auth().addStateDidChangeListener { [weak self](auth, user) in
            if let user = user {
                self?.user = user
            }
            else {
                self?.user = nil
            }
        }
    }
    
    // MARK: - Dispose
    
    func dispose() {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
}
