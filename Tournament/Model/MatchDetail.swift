//
//  MatchDetail.swift
//  Tournament
//
//  Created by Danny on 11/9/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

class MatchDetail: Codable {
    let matchId: Int
    let direScore: Int
    let direTeamId: Int
    let duration: Int
    let gameMode: GameMode
    let leagueid: Int
    let lobbyType: LobbyType
    let matchSeqNum: Int?
    let pickBans: [MatchPickBan]?
    let radiantScore: Int
    let radiantTeamId: Int?
    let radiantWin: Bool
    let skill: SkillLevel?
    let startTime: Int
    let seriesId: Int?
    let seriesType: Int?
    let league: League
    let radiantTeam: Team?
    let direTeam: Team?
    let players: [MatchPlayerData]?
    let patch: Int
    let region: Int
    let replayUrl: String?
}
