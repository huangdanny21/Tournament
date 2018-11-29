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
        return stackView
    }()
    
    // Textfields
    
    private let steamIdTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.borderStyle = .line
        textfield.setLeftPaddingPoints(10)
        textfield.setRightPaddingPoints(10)
        return textfield
    }()
    
    private let serverTextField: UITextField = {
        let textfield = UITextField()
        return textfield
    }()
    
    private let tierTextField: UITextField = {
        let textfield = UITextField()
        return textfield
    }()
    
    private let roleTextField: UITextField = {
        let textfield = UITextField()
        return textfield
    }()
    
    private let otherInformationTextField: UITextField = {
        let textfield = UITextField()
        return textfield
    }()
    
    private lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [steamIdTextField, serverTextField, tierTextField, roleTextField, otherInformationTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 7.5
        stackView.axis = .vertical
        return stackView
    }()
    
    let submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.green
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [labelsStackView, textFieldStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 7.5
        stackView.distribution = .fill
        stackView.axis = .horizontal
        return stackView
    }()
    
    // MARK: - Init
    
    override func commonInit() {
       setAttributedText()

        addSubview(stackView)
        backgroundColor = UIColor.white
        
        stackView.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
        }
        
        textFieldStackView.snp.makeConstraints { (make) in
            make.height.equalTo(labelsStackView.snp.height)
        }
        
        addSubview(submitButton)
        submitButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(labelsStackView.snp.bottom).offset(20)
        }
        
        steamIdTextField.snp.makeConstraints { (make) in
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
