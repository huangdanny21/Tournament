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

    private let viewModel: SignUpViewModel
    private let alertPresenter: AlertPresenter_Proto
    private let disposeBag = DisposeBag()

    private lazy var signUpView: SignUpView = {
       return SignUpView()
    }()
    
    // MARK: - Constructors
    
    init(alertPresenter: AlertPresenter_Proto = AlertPresenter(), viewModel: SignUpViewModel = SignUpViewModel()) {
        self.viewModel = viewModel
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
        bindLoadingIndicator()
        bindRx()
    }
    
    // MARK: - Binding
    
    private func bindRx() {
        signUpView.loginButton.rx.tap
            .subscribe(onNext: { [weak self]() in
                let loginVC = LoginViewController()
                self?.navigationController?.pushViewController(loginVC, animated: true)
            })
            .disposed(by: disposeBag)
        
        signUpView.signUpButton.rx.tap
            .subscribe(onNext: { [weak self]() in
                self?.viewModel.signUp(withUsername: self?.signUpView.usernameTextField.text, email: self?.signUpView.emailTextField.text, password: self?.signUpView.passwordTextField.text, confirmPassword: self?.signUpView.confirmPasswordTextField.text)
            })
            .disposed(by: disposeBag)
        
        viewModel
            .signUp
            .subscribe(onNext: { [unowned self](userResult) in
                if let user = userResult.user {
                    self.didSignUpSuccessFully(withUsername: self.signUpView.usernameTextField.text ?? "", user: user)
                }
                else if let error = userResult.error {
                    self.alertPresenter.present(from: self, title: "", message: error.localizedDescription, dismissButtonTitle: "Ok")
                }
                else {
                    self.alertPresenter.present(from: self, title: "", message: GenericError.unknown.localizedDescription, dismissButtonTitle: "Ok")
                }
            }, onError: { [unowned self](error) in
                self.alertPresenter.present(from: self, title: "", message: error.localizedDescription, dismissButtonTitle: "Ok")
            })
            .disposed(by: disposeBag)
    }
    
    private func bindLoadingIndicator() {
        let progress = MBProgressHUD()
        progress.mode = .indeterminate
        progress.label.text = "Signing up..."
        
        viewModel
            .activityIndicator.asDriver()
            .drive(progress.rx_mbprogresshud_animating)
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
