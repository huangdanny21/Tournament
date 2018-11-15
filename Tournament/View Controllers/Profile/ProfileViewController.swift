//
//  ProfileViewController.swift
//  Tournament
//
//  Created by Danny on 11/14/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit
import Firebase
import RxSwift

class ProfileViewController: UIViewController {
    
    private let viewModel: ProfileViewModel
    private let disposeBag = DisposeBag()

    private var handle: AuthStateDidChangeListenerHandle?

    lazy var profileView: ProfileView = {
        return ProfileView()
    }()
    
    // MARK: - Constructors

    init(viewModel: ProfileViewModel = ProfileViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controller Life Cycle
    
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
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
        let signUpVC = SignUpViewController()
        let navVC = UINavigationController(rootViewController: signUpVC)
        navigationController?.present(navVC, animated: true, completion: nil)
    }
    
    private func displaySignInState(withUser user: User) {
        
    }
    
}
