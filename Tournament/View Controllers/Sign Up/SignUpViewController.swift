//
//  SignUpViewController.swift
//  Tournament
//
//  Created by Danny on 11/14/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit
import RxSwift
import Firebase

class SignUpViewController: BaseKeyboardViewController {
    private let alertPresenter: AlertPresenter_Proto
    private let disposeBag = DisposeBag()

    private lazy var signUpView: SignUpView = {
       return SignUpView()
    }()
    
    // MARK: - Constructors
    
    init(alertPresenter: AlertPresenter_Proto = AlertPresenter()) {
        self.alertPresenter = alertPresenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controller Life Cycle
    
    override func loadView() {
        view = signUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
        addCloseButton()
        bindRx()
    }
    
    // MARK: - Binding
    
    private func bindRx() {
        let inputs = SignUpViewModel.Inputs(
            signUpTapped: signUpView.signUpButton.rx.tap.asObservable(),
            loginTapped: signUpView.loginButton.rx.tap.asObservable(),
            usernameText: signUpView.usernameTextField.rx.text.orEmpty.asObservable(),
            emailText: signUpView.emailTextField.rx.text.orEmpty.asObservable(),
            passwordText: signUpView.passwordTextField.rx.text.orEmpty.asObservable()
        )
        
        let viewModel = SignUpViewModel(inputs)

        let progress = MBProgressHUD()
        progress.mode = .indeterminate
        progress.label.text = "Signing up..."

        viewModel.isNetworkActive
            .drive(progress.rx_mbprogresshud_animating)
            .disposed(by: disposeBag)
        
        viewModel
            .errorMessage
            .drive(onNext: { [unowned self] (error) in
                self.alertPresenter.present(from: self, title: "", message: error, dismissButtonTitle: "Ok")
            })
            .disposed(by: disposeBag)
        
        viewModel
            .userCreated
            .drive(onNext: { (user) in
                self.didSignUpSuccessFully(withUsername: user.0, user: user.1)
            })
            .disposed(by: disposeBag)
        
        viewModel
            .toLogin
            .drive(onNext:  { [weak self](_) in
                let loginVC = LoginViewController()
                self?.navigationController?.pushViewController(loginVC, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Private
    
    private func didSignUpSuccessFully(withUsername username: String, user: User) {
        let docRef = Firestore.firestore().collection("users").document(username)
        let docData: [String: Any] = [
            "username" : username,
            "uid": user.uid,
            "email": user.email ?? NSNull(),
            "created_at": FieldValue.serverTimestamp()
        ]
        
        docRef.setData(docData)
        
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = username
        changeRequest?.commitChanges { [weak self](error) in
            self?.navigationController?.dismiss(animated: true, completion: nil)
        }
    }
    
    private func addCloseButton() {
        let closeButton = UIButton(type: .custom)
        closeButton.frame = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
        closeButton.setImage(UIImage(named:"small_x_icon"), for: .normal)
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: closeButton)
        let currWidth = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 30)
        currWidth?.isActive = true
        let currHeight = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 30)
        currHeight?.isActive = true
        self.navigationItem.leftBarButtonItem = menuBarItem
    }
    
    @objc private func close() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
