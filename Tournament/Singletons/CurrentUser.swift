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
    private init() {}
    static let shared = CurrentUser()
    
    // MARK: - Setter
    
    func setUser(_ user: User){
        self.user = user
    }
    
}
