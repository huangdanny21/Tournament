//
//  SignUpView.swift
//  Tournament
//
//  Created by Danny on 11/14/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import SnapKit

class SignUpView: BaseView {
    let usernameTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.placeholder = "Username"
        textField.text = "huangdanny21"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.addBottomSeperator()
        textField.roundedTopCorners(radius: 10)
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        return textField
    }()
    
    let emailTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.placeholder = "Email"
        textField.text = "huangdanny21@gmail.com"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.addBottomSeperator()
        //textField.keyboardType = .emailAddress
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        return textField
    }()
    
    let passwordTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.placeholder = "Password"
        textField.text = "one2three"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.roundedBottomCorners(radius: 10)
        //textField.isSecureTextEntry = true
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        return textField
    }()
    
    private lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [usernameTextField, emailTextField, passwordTextField])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.darkText
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.textColor = UIColor.white
        return button
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.textColor = UIColor.lightGray
        button.setTitle("Have an account? Login here >", for: .normal)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textFieldStackView, signUpButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    // MARK: - Init
    
    override func commonInit() {
        backgroundColor = UIColor.black
        
        addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalTo(self.snp.bottom).offset(-50)
        }
        
        addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalTo(self.loginButton.snp.top).offset(-10)
        }
        usernameTextField.snp.makeConstraints { (make) in
            make.height.equalTo(50)
        }
    }
}
