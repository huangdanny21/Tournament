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

    private let viewModel: LoginViewModel
    private let alertPresenter: AlertPresenter_Proto
    private let disposeBag = DisposeBag()
    
    //private var progress: MBProgressHUD!
    
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
        bindLoadingIndicator()
        bindRx()
    }
    
    // MARK: - Binding
    
    private func bindRx() {
        loginView.loginButton.rx.tap
            .subscribe(onNext: { [weak self]() in
                self?.viewModel.login(withEmail: self?.loginView.emailTextField.text, password: self?.loginView.passwordTextField.text)
            })
            .disposed(by: disposeBag)
        
        viewModel
            .login
            .subscribe(onNext: { [weak self](user) in
                self?.navigationController?.dismiss(animated: true, completion: nil)
                }, onError: { [unowned self](error) in
                    self.alertPresenter.present(from: self, title: "", message: error.localizedDescription, dismissButtonTitle: "Ok")
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
    
    private func bindLoadingIndicator() {
        let progress = MBProgressHUD()
        progress.mode = .indeterminate
        progress.label.text = "Logging in..."
        
        viewModel
            .activityIndicator.asDriver()
            .drive(progress.rx_mbprogresshud_animating)
            .disposed(by: disposeBag)
    }
    
    private func loginSucessFully(withUser user: User) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
