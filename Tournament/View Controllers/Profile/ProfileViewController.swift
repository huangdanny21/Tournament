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
    private let alertPresenter: AlertPresenter_Proto
    private let disposeBag = DisposeBag()

    private var handle: AuthStateDidChangeListenerHandle?

    lazy var profileView: ProfileView = {
        return ProfileView()
    }()
    
    // MARK: - Constructors

    init(alertPresenter: AlertPresenter_Proto = AlertPresenter(), viewModel: ProfileViewModel = ProfileViewModel()) {
        self.viewModel = viewModel
        self.alertPresenter = alertPresenter
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
        addSignOutButton()
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
    
    // MARK: - Private
    
    private func addSignOutButton() {
        let logoutButton = UIButton(type: .custom)
        logoutButton.frame = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
        logoutButton.setImage(UIImage(named:"power_down_icon"), for: .normal)
        logoutButton.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: logoutButton)
        let currWidth = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 30)
        currWidth?.isActive = true
        let currHeight = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 30)
        currHeight?.isActive = true
        self.navigationItem.rightBarButtonItem = menuBarItem
    }
    
    @objc private func signOut() {
        do {
            try Auth.auth().signOut()
            alertPresenter.present(from: self, title: "", message: "Logged out successfully", dismissButtonTitle: "Ok")
        }
        catch {
            alertPresenter.present(from: self, title: "", message: error.localizedDescription, dismissButtonTitle: "Ok")
        }
    }
}
