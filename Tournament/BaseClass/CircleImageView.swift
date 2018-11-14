//
//  CircleImageView.swift
//  Tournament
//
//  Created by Danny on 11/14/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {
    
    // MARK: - Constructor
    
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
    
    private func commonInit() {
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = self.frame.size.width/2
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.clipsToBounds = true
    }
    
    // MARK: - View Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        self.layer.borderColor = UIColor.white.cgColor
//        self.layer.cornerRadius = self.frame.size.width/2
//        self.layer.borderWidth = 1
//        self.layer.masksToBounds = false
//        self.clipsToBounds = true
    }
}
