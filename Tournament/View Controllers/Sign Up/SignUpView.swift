//
//  SignUpView.swift
//  Tournament
//
//  Created by Danny on 11/14/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import SnapKit

class SignUpView: BaseView {
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        return textField
    }()
    
    private let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Confirm Password"
        return textField
    }()
    
    private lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.emailTextField, self.passwordTextField, self.confirmPasswordTextField])
        stackView.axis = .vertical
        return stackView
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "Sign Up"
        return button
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Have an account? Login here >"
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.textFieldStackView, signUpButton, self.loginLabel])
        stackView.axis = .vertical
        return stackView
    }()
    
    // MARK: - Init
    
    override func commonInit() {
        
    }
    
}
