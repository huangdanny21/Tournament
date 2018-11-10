//
//  GameMode.swift
//  Dota Central
//
//  Created by Danny on 8/29/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

protocol DotaGameTypeMetaData {
    var name: String { get }
    var isBalanced: Bool { get }
}

enum GameMode: Int, Codable {
    case unknown
    case allPick
    case captionsMode
    case randomDraft
    case singleDraft
    case allRandom
    case intro
    case direTide
    case reverseCaptainsMode
    case greeviling
    case tutorial
    case midOnly
    case leastPlayed
    case limitedHeroes
    case compendiumMatchMaking
    case custom
    case captainsDraft
    case balancedDraft
    case abilityDraft
    case event
    case allRandomDeathMatch
    case oneVoneMid
    case allDraft
    case turbo
    case mutation
}

extension GameMode: DotaGameTypeMetaData {
    var name: String {
        get {
            switch self {
            case .unknown:
                return "Unknown"
            case .allPick:
                return "All Pick"
            case .captionsMode:
                return "Captions Mode"
            case .randomDraft:
                return "Random Draft"
            case .singleDraft:
                return "Single Draft"
            case .allRandom:
                return "All Random"
            case .intro:
                return "Intro"
            case .direTide:
                return "Diretide"
            case .reverseCaptainsMode:
                return "Reverse Captions Mode"
            case .greeviling:
                return "Greeviling"
            case .tutorial:
                return "Tutorial"
            case .midOnly:
                return "Mid Onky"
            case .leastPlayed:
                return "Least Played"
            case .limitedHeroes:
                return "Limited Heroes"
            case .compendiumMatchMaking:
                return "Compendium Match Making"
            case .custom:
                return "Custom"
            case .captainsDraft:
                return "Captains Draft"
            case .balancedDraft:
                return "Balanced Draft"
            case .abilityDraft:
                return "Ability Draft"
            case .event:
                return "Event"
            case .allRandomDeathMatch:
                return "All Random Death Match"
            case .oneVoneMid:
                return "1v1 Mid"
            case .allDraft:
                return "All Draft"
            case .turbo:
                return "Turbo"
            case .mutation:
                return "Mutation"
            }
        }
    }
    
    var isBalanced: Bool {
        get {
            switch self {
            case .intro,
                 .direTide,
                 .reverseCaptainsMode,
                 .greeviling,
                 .tutorial,
                 .midOnly,
                 .limitedHeroes,
                 .compendiumMatchMaking,
                 .custom,
                 .abilityDraft,
                 .event,
                 .allRandomDeathMatch,
                 .oneVoneMid,
                 .turbo,
                 .mutation :
                return false
            default:
                return true
            }
        }
    }
}
