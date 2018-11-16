//
//  LoginView.swift
//  Tournament
//
//  Created by Danny on 11/15/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import SnapKit

class LoginView: BaseView {
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.setLeftPaddingPoints(10)
        textField.setRightPaddingPoints(10)
        textField.addBottomSeperator()
        textField.roundedTopCorners(radius: 10)
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.setLeftPaddingPoints(10)
        textField.setRightPaddingPoints(10)
        textField.roundedBottomCorners(radius: 10)
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.emailTextField, self.passwordTextField])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.darkText
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.textColor = UIColor.white
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.textFieldStackView, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    // MARK: - Init
    
    override func commonInit() {
        backgroundColor = UIColor.black
        addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-110)
        }
        emailTextField.snp.makeConstraints { (make) in
            make.height.equalTo(50)
        }
    }
    
}
