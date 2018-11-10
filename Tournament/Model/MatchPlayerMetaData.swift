//
//  MatchPlayerMetaData.swift
//  Dota Central
//
//  Created by Danny on 9/1/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

class AdditionalUnit: Codable {
    let name:  String
    let itemZero: Int
    let itemOne: Int
    let itemTwo: Int
    let itemThree: Int
    let itemFour: Int
    let itemFive: Int

    private enum CodingKeys: String, CodingKey {
        case name = "unitname"
        case itemZero = "item_0"
        case itemOne = "item_1"
        case itemTwo = "item_2"
        case itemThree = "item_3"
        case itemFour = "item_4"
        case itemFive = "item_5"
    }
}

class MatchPickBan: Codable {
    let isPicked: Bool
    let heroId: Int
    let team: Int
    let order: Int
    let matchId: Int?
    
    private enum CodingKeys: String, CodingKey {
        case isPicked = "is_pick"
        case heroId = "hero_id"
        case team = "team"
        case order = "order"
        case matchId = "match_id"
    }
}

class MatchPlayerData: Codable {
    let matchId: Int?
    let playerSlot: Int
    let accountId: Int?
    let additionalUnit: [AdditionalUnit]?
    let assists: Int
    let gpm: Int
    let heroId: Int
    let backPackZero: Int
    let backPackOne: Int
    let backPackTwo: Int
    let itemZero: Int
    let itemOne: Int
    let itemTwo: Int
    let itemThree: Int
    let itemFour: Int
    let itemFive: Int
    let kills: Int
    let level: Int
    let personaName: String?
    let didRadiantWin: Bool
    let startTime: Int
    let duration: Int
    let lobbyType: LobbyType
    let gameMode: GameMode
    let patch: Int
    let region: Int
    let isRadiant: Bool
    let leaverStatus: Int
    
    private enum CodingKeys: String, CodingKey {
        case matchId = "match_id"
        case playerSlot = "player_slot"
        case accountId = "account_id"
        case additionalUnit = "additional_units"
        case assists = "assists"
        case gpm = "gold_per_min"
        case heroId = "hero_id"
        case backPackZero = "backpack_0"
        case backPackOne = "backpack_1"
        case backPackTwo = "backpack_2"
        case itemZero = "item_0"
        case itemOne = "item_1"
        case itemTwo = "item_2"
        case itemThree = "item_3"
        case itemFour = "item_4"
        case itemFive = "item_5"
        case kills = "kills"
        case level = "level"
        case personaName = "personaname"
        case didRadiantWin = "radiant_win"
        case startTime = "start_time"
        case duration = "duration"
        case lobbyType = "lobby_type"
        case gameMode = "game_mode"
        case patch = "patch"
        case region = "region"
        case isRadiant = "isRadiant"
        case leaverStatus = "leaver_status"
    }
    
}

