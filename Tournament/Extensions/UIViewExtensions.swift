//
//  UIViewExtensions.swift
//  Tournament
//
//  Created by Danny on 11/15/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import SnapKit

extension UIView {
    func addBottomSeperator(withColor color: UIColor = UIColor.lightGray, height: CGFloat = 0.5) {
        let view = UIView(frame: .zero)
        view.backgroundColor = color
        addSubview(view)
        
        view.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(height)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func roundedTopCorners(radius: CGFloat) {
        if #available(iOS 11.0, *) {
            self.clipsToBounds = false
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        else {
            let rectShape = CAShapeLayer()
            rectShape.bounds = frame
            rectShape.position = center
            rectShape.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topLeft , .topRight], cornerRadii: CGSize(width: 20, height: 20)).cgPath
            layer.mask = rectShape
        }
    }
    
    func roundedBottomCorners(radius: CGFloat) {
        if #available(iOS 11.0, *) {
            self.clipsToBounds = false
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
        else {
            let rectShape = CAShapeLayer()
            rectShape.bounds = frame
            rectShape.position = center
            rectShape.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 20, height: 20)).cgPath
            layer.mask = rectShape
        }
    }
}
