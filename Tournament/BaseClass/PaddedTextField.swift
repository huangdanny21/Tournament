//
//  PaddedTextField.swift
//  Tournament
//
//  Created by Danny on 11/28/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit

class PaddedTextField: UITextField {

    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    public func commonInit() {
        setLeftPaddingPoints(10)
        setRightPaddingPoints(10)
    }
}
