//
//  BattleCupView.swift
//  Tournament
//
//  Created by Danny on 11/25/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import SnapKit

class BattleCupView: BaseView {
    let createRequestButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create Request", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.green
        return button
    }()
    
    // MARK: - Init
    
    override func commonInit() {
        addSubview(createRequestButton)
        
        createRequestButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        backgroundColor = UIColor.white
    }
}
