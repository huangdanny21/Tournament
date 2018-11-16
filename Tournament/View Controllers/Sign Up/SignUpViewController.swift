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

class SignUpViewController: UIViewController {

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
        bindRx()
    }
    
    // MARK: - Binding
    
    private func bindRx() {
        let progress = MBProgressHUD(view: signUpView)
        progress.mode = .indeterminate
        progress.label.text = "Creating..."
        
        viewModel
            .activityIndicator.asDriver()
            .drive(progress.rx_mbprogresshud_animating)
            .disposed(by: disposeBag)
        
        signUpView.loginButton.rx.tap
            .subscribe(onNext: { [weak self]() in
                let loginVC = LoginViewController()
                self?.navigationController?.pushViewController(loginVC, animated: true)
            })
            .disposed(by: disposeBag)
        
        signUpView.signUpButton.rx.tap
            .subscribe(onNext: { [weak self]() in
                self?.viewModel.signUp(withEmail: self?.signUpView.emailTextField.text, password: self?.signUpView.passwordTextField.text, confirmPassword: self?.signUpView.confirmPasswordTextField.text)
            })
            .disposed(by: disposeBag)
        
        viewModel
            .didSignUp
            .subscribe(onNext: { [weak self](user) in
                self?.signedUpSucessFully(withUser: user)
            })
            .disposed(by: disposeBag)
        
        viewModel
            .signUpError
            .subscribe(onNext: { [unowned self](message) in
                self.alertPresenter.present(from: self, title: "", message: message, dismissButtonTitle: "Ok")
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Private
    
    private func signedUpSucessFully(withUser user: User) {
        navigationController?.dismiss(animated: true, completion: nil)
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
