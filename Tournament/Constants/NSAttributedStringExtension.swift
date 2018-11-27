//
//  NSAttributedStringExtension.swift
//  MyFitnessPalSample
//
//  Created by Danny on 11/22/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
    @discardableResult func bold(_ text: String, _ fontSize: CGFloat) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: fontSize, weight: .bold)]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        return self
    }
    
    @discardableResult func normal(_ text: String) -> NSMutableAttributedString {
        let normal = NSAttributedString(string: text)
        append(normal)
        return self
    }
}
