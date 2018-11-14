//
//  MatchDetailObjectViewModel.swift
//  Tournament
//
//  Created by Danny on 11/10/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

protocol MatchDetailObjectViewModel_Protocol {
    var startDate: String { get }
    var duration: String { get }
    var skillLevel: String { get }
    var gameMode: String { get }
}

class MatchDetailObjectViewModel: BaseObjectViewModel<MatchDetail> {
    
}

extension MatchDetailObjectViewModel: MatchDetailObjectViewModel_Protocol {
    var startDate: String {
        get {
            if let timeInterval = Double(exactly: object.startTime) {
                return Date(timeIntervalSince1970: timeInterval).timeAgoSinceNow
            }
            return "a moment ago"
        }
    }
    
    var duration: String {
        get {
            let formattedString = DateUtil.readableTimeInteralText(forInterval: object.duration)
            return formattedString
        }
    }
    
    var skillLevel: String {
        get {
            guard let skillDescription = object.skill?.description else {
                return SkillLevel.normal.description
            }
            return skillDescription
        }
    }
    
    var gameMode: String {
        get {
            return object.gameMode.name
        }
    }
}
