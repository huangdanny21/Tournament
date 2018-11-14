//
//  ProMatchViewModel.swift
//  Tournament
//
//  Created by Danny on 11/9/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

protocol ProMatchObjectViewModel_Protocol {
    var score: String { get }
    var radiantName: String { get }
    var direName: String { get }
    var startTime: String { get }
    
}

class ProMatchObjectViewModel: BaseObjectViewModel<ProMatch> {
    
}

extension ProMatchObjectViewModel: ProMatchObjectViewModel_Protocol {
    var score: String {
        get {
            return "\(object.radiantScore)    :    \(object.direScore)"
        }
    }
    
    var radiantName: String {
        get {
            return object.radiantName ?? "Radiant"
        }
    }
    
    var direName: String {
        get {
            return object.direName ?? "Dire"
        }
    }
    
    var startTime: String {
        get {
            if let timeInterval = Double(exactly: object.startTime) {
                return Date(timeIntervalSince1970: timeInterval).timeAgoSinceNow
            }
            return "a moment ago"
        }
    }
}

