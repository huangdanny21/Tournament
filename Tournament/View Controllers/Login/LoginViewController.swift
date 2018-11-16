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
        hideKeyboard()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
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
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    private func loginSucessFully(withUser user: User) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
}
