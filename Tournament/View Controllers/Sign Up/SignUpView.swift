//
//  SignUpView.swift
//  Tournament
//
//  Created by Danny on 11/14/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import SnapKit

class SignUpView: BaseView {
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.setLeftPaddingPoints(10)
        textField.setRightPaddingPoints(10)
        textField.addBottomSeperator()
        textField.roundedTopCorners(radius: 10)
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.setLeftPaddingPoints(10)
        textField.setRightPaddingPoints(10)
        textField.addBottomSeperator()
        return textField
    }()
    
    let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Confirm Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.setLeftPaddingPoints(10)
        textField.setRightPaddingPoints(10)
        textField.roundedBottomCorners(radius: 10)
        return textField
    }()
    
    private lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.emailTextField, self.passwordTextField, self.confirmPasswordTextField])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.darkText
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.textColor = UIColor.white
        return button
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.textColor = UIColor.lightGray
        button.setTitle("Have an account? Login here >", for: .normal)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.textFieldStackView, signUpButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    // MARK: - Init
    
    override func commonInit() {
        addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-50)
        }
        
        addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalTo(self.loginButton.snp.top).offset(-10)
        }
        emailTextField.snp.makeConstraints { (make) in
            make.height.equalTo(50)
        }
    }
}
