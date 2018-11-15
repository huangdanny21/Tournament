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
    let isPick: Bool
    let heroId: Int
    let team: Int
    let order: Int
    let matchId: Int?
}

class MatchPlayerData: Codable {
    let matchId: Int
    let playerSlot: Int
    let accountId: Int
    let additionalUnit: [AdditionalUnit]?
    let assists: Int
    let deaths: Int
    let denies: Int
    let goldPerMin: Int
    let heroId: Int
    let backpack0: Int
    let backpack1: Int
    let backpack2: Int
    let item0: Int
    let item1: Int
    let item2: Int
    let item3: Int
    let item4: Int
    let item5: Int
    let kills: Int
    let level: Int
    let personaName: String?
    let name: String?
    let radiantWin: Bool
    let startTime: Int
    let duration: Int
    let lobbyType: LobbyType
    let gameMode: GameMode
    let patch: Int
    let region: Int
    let isRadiant: Bool
    let leaverStatus: Int
    let kda: Int
    let lane: Lane?
    let laneRole: Int
}

