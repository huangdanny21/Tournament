//
//  DateExtension.swift
//  Tournament
//
//  Created by Danny on 11/9/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

extension Date {
    var timeAgoSinceNow: String {
        return getTimeAgoSinceNow() + " ago"
    }
    
    private func getTimeAgoSinceNow() -> String {
        var interval = Calendar.current.dateComponents([.year], from: self, to: Date()).year!
        if interval > 0 {
            return interval == 1 ? "\(interval)" + " year" : "\(interval)" + " years"
        }
        
        interval = Calendar.current.dateComponents([.month], from: self, to: Date()).month!
        if interval > 0 {
            return interval == 1 ? "\(interval)" + " month" : "\(interval)" + " months"
        }
        
        interval = Calendar.current.dateComponents([.day], from: self, to: Date()).day!
        if interval > 0 {
            return interval == 1 ? "\(interval)" + " day" : "\(interval)" + " days"
        }
        
        interval = Calendar.current.dateComponents([.hour], from: self, to: Date()).hour!
        if interval > 0 {
            return interval == 1 ? "\(interval)" + " hour" : "\(interval)" + " hours"
        }
        
        interval = Calendar.current.dateComponents([.minute], from: self, to: Date()).minute!
        if interval > 0 {
            return interval == 1 ? "\(interval)" + " minute" : "\(interval)" + " minutes"
        }
        
        return "a moment"
    }
}
