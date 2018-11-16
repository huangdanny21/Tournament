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

class LoginViewController: UIViewController {

    private let viewModel: LoginViewModel
    private let alertPresenter: AlertPresenter_Proto
    private let disposeBag = DisposeBag()
    
    private lazy var loginView: LoginView = {
        return LoginView()
    }()
    
    // MARK: - Constructors
    
    init(alertPresenter: AlertPresenter_Proto = AlertPresenter(), viewModel: LoginViewModel = LoginViewModel()) {
        self.viewModel = viewModel
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
        let progress = MBProgressHUD(view: loginView)
        progress.mode = .indeterminate
        progress.label.text = "Logging in..."
        
        viewModel
            .activityIndicator.asDriver()
            .drive(progress.rx_mbprogresshud_animating)
            .disposed(by: disposeBag)
        
        loginView.loginButton.rx.tap
            .subscribe(onNext: { [weak self]() in
                self?.viewModel.login(withEmail: self?.loginView.emailTextField.text, password: self?.loginView.passwordTextField.text)
            })
            .disposed(by: disposeBag)
        
        viewModel
            .didLogin
            .subscribe(onNext: { [weak self](user) in
                self?.loginSucessFully(withUser: user)
            })
            .disposed(by: disposeBag)
        
        viewModel
            .loginError
            .subscribe(onNext: { [unowned self](message) in
                self.alertPresenter.present(from: self, title: "", message: message, dismissButtonTitle: "Ok")
            })
            .disposed(by: disposeBag)
        
    }
    
    // MARK: - Private
    
    private func loginSucessFully(withUser user: User) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
}
