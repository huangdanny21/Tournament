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
        let stackView = UIStackView(arrangedSubviews: [steamIdLabel, serverLabel, tierLabel, roleLabel, otherInformationLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 7.5
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [labelsStackView, textFieldStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.axis = .horizontal
        return stackView
    }()
    
    // MARK: - Init
    
    override func commonInit() {
        addSubview(stackView)
        backgroundColor = UIColor.white
        
        let steamIdAttributedText = NSMutableAttributedString()
        steamIdAttributedText.bold("Steam ID:", 25)
        steamIdLabel.attributedText = steamIdAttributedText
        
        let serverAttributedText = NSMutableAttributedString()
        serverAttributedText.bold("Server:", 25)
        serverLabel.attributedText = serverAttributedText
        
        let tierAttributedText = NSMutableAttributedString()
        tierAttributedText.bold("Tier:", 25)
        tierLabel.attributedText = tierAttributedText
        
        let roleAttributedText = NSMutableAttributedString()
        roleAttributedText.bold("Preferred Role:", 25)
        roleLabel.attributedText = roleAttributedText
        
        let otherInformationAttributedText = NSMutableAttributedString()
        otherInformationAttributedText.bold("Other Information:", 25)
        otherInformationLabel.attributedText = otherInformationAttributedText
    }
    
}
