//
//  ProfileViewController.swift
//  Tournament
//
//  Created by Danny on 11/14/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    private var handle: AuthStateDidChangeListenerHandle?

    // MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handle = Auth.auth().addStateDidChangeListener { [weak self](auth, user) in
            if let user = user {
                self?.displaySignInState(withUser: user)
            }
            else {
                self?.displaySignOutState()
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    // MARK: - State
    
    private func displaySignOutState() {
        
    }
    
    private func displaySignInState(withUser user: User) {
        
    }
    
}
