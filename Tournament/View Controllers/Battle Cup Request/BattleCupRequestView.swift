//
//  BattleCupRequestView.swift
//  Tournament
//
//  Created by Danny on 11/26/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit

class BattleCupRequestView: BaseView {
    
    // Labels
    
    private let steamIdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let serverLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tierLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let roleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let otherInformationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [steamIdLabel, serverLabel, tierLabel, roleLabel, otherInformationLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 7.5
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // Textfields
    
    let steamIdTextField: PaddedTextField = {
        let textfield = PaddedTextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.borderStyle = .line
        textfield.placeholder = "Required"
        return textfield
    }()
    
    let serverTextField: PaddedTextField = {
        let textfield = PaddedTextField()
        textfield.borderStyle = .line
        textfield.placeholder = "Required"
        return textfield
    }()
    
    let tierTextField: PaddedTextField = {
        let textfield = PaddedTextField()
        textfield.borderStyle = .line
        textfield.placeholder = "Required"
        return textfield
    }()
    
    let roleTextField: PaddedTextField = {
        let textfield = PaddedTextField()
        textfield.borderStyle = .line
        textfield.placeholder = "Optional"
        return textfield
    }()
    
    let otherInformationTextField: PaddedTextField = {
        let textfield = PaddedTextField()
        textfield.placeholder = "Optional"
        textfield.borderStyle = .line
        return textfield
    }()
    
    private lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [steamIdTextField, serverTextField, tierTextField, roleTextField, otherInformationTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 7.5
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.0
        return button
    }()
    
    // MARK: - Init
    
    override func commonInit() {
       setAttributedText()

        addSubview(labelsStackView)
        backgroundColor = UIColor.white
        
        labelsStackView.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.width.equalTo(otherInformationLabel.intrinsicContentSize.width)
        }
        
        addSubview(textFieldStackView)
        textFieldStackView.snp.makeConstraints { (make) in
            make.left.equalTo(labelsStackView.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
        }
        
        addSubview(submitButton)
        submitButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(labelsStackView.snp.bottom).offset(20)
        }
        
        steamIdTextField.snp.makeConstraints { (make) in
            make.height.equalTo(steamIdLabel.snp.height)
        }
        
        serverTextField.snp.makeConstraints { (make) in
            make.height.equalTo(steamIdLabel.snp.height)
        }
        
        tierTextField.snp.makeConstraints { (make) in
            make.height.equalTo(steamIdLabel.snp.height)
        }
        
        roleTextField.snp.makeConstraints { (make) in
            make.height.equalTo(steamIdLabel.snp.height)
        }
        
        otherInformationTextField.snp.makeConstraints { (make) in
            make.height.equalTo(steamIdLabel.snp.height)
        }
    }
    
    private func setAttributedText() {
        let steamIdAttributedText = NSMutableAttributedString()
        steamIdAttributedText.bold("Steam ID:", 15)
        steamIdLabel.attributedText = steamIdAttributedText
        
        let serverAttributedText = NSMutableAttributedString()
        serverAttributedText.bold("Server:", 15)
        serverLabel.attributedText = serverAttributedText
        
        let tierAttributedText = NSMutableAttributedString()
        tierAttributedText.bold("Tier:", 15)
        tierLabel.attributedText = tierAttributedText
        
        let roleAttributedText = NSMutableAttributedString()
        roleAttributedText.bold("Preferred Role:", 15)
        roleLabel.attributedText = roleAttributedText
        
        let otherInformationAttributedText = NSMutableAttributedString()
        otherInformationAttributedText.bold("Other Information:", 15)
        otherInformationLabel.attributedText = otherInformationAttributedText
    }
    
}
