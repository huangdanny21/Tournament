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
    var numOfSection: Int { get }
    var radiantPlayers: [MatchPlayerData] { get }
    var direPlayers: [MatchPlayerData] { get }
}

class MatchDetailObjectViewModel: BaseObjectViewModel<MatchDetail> {
    
}

extension MatchDetailObjectViewModel: MatchDetailObjectViewModel_Protocol {
    
    var radiantPlayers: [MatchPlayerData] {
        get {
            guard let players = object.players else {
                return []
            }
            let radiantPlayers = Array(players.prefix(4))
            print("Radiant Players Count: \(radiantPlayers.count)")
            return radiantPlayers
        }
    }
    
    var direPlayers: [MatchPlayerData] {
        get {
            guard let players = object.players else {
                return []
            }
            let direPlayers = Array(players.suffix(from: 5))
            print("Dire Players Count: \(radiantPlayers.count)")
            return direPlayers
        }
    }
    
    var numOfSection: Int {
        get {
            return 2
        }
    }
    
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
