//
//  DateUtil.swift
//  Tournament
//
//  Created by Danny on 11/14/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

class DateUtil {
    class func readableTimeInteralText(forInterval interval: Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .full
        
        let formattedString = formatter.string(from: TimeInterval(interval))!
        return formattedString
    }
}
