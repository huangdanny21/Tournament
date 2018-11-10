//
//  LobbyType.swift
//  Dota Central
//
//  Created by Danny on 8/29/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

enum LobbyType: Int, Codable {
    case normal
    case practice
    case tournament
    case tutorial
    case coopBots
    case teamMatchMaking
    case soloMatchMaking
    case ranked
    case oneVoneMid
    case battleCup
}

extension LobbyType: DotaGameTypeMetaData {
    var name: String {
        get {
            switch self {
            case .normal:
                return "Normal"
            case .practice:
                return "Practice"
            case .tournament:
                return "Tournament"
            case .tutorial:
                return "Totorial"
            case .coopBots:
                return "Co-op Bots"
            case .teamMatchMaking:
                return "Team Match Making"
            case .soloMatchMaking:
                return "Solo Match Making"
            case .ranked:
                return "Ranked"
            case .oneVoneMid:
                return "1v1 Mid"
            case .battleCup:
                return "Battle Cup"
            }
        }
    }
    
    var isBalanced: Bool {
        get {
            switch self {
            case .coopBots, .oneVoneMid:
                return false
            default:
                return true
            }
        }
    }
}
