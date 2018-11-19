//
//  LoginViewController.swift
//  Tournament
//
//  Created by Danny on 11/15/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit
import RxSwift
import Firebase

class LoginViewController: BaseKeyboardViewController {
    private let alertPresenter: AlertPresenter_Proto
    private let disposeBag = DisposeBag()
    
    private lazy var loginView: LoginView = {
        return LoginView()
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
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        bindRx()
    }
    
    // MARK: - Binding
    
    private func bindRx() {
        let inputs = LoginViewModel.Inputs(
            loginTapped: loginView.loginButton.rx.tap.asObservable(),
            emailText: loginView.emailTextField.rx.text.orEmpty.asObservable(),
            passwordText: loginView.passwordTextField.rx.text.orEmpty.asObservable()
        )
        
        let viewModel = LoginViewModel(inputs)
        
        let progress = MBProgressHUD()
        progress.mode = .indeterminate
        progress.label.text = "Signing up..."
        
        isFirebaseNetworkActive
            .drive(progress.rx_mbprogresshud_animating)
            .disposed(by: disposeBag)
        
        viewModel
            .loggedIn
            .drive(onNext: { [weak self](user) in
                self?.navigationController?.dismiss(animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
        
        viewModel
            .errorMessage
            .drive(onNext: { [unowned self](message) in
                self.alertPresenter.present(from: self, title: "", message: message, dismissButtonTitle: "Ok")
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Private
    
    private func loginSucessFully(withUser user: User) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
