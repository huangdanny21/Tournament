//
//  ProMatch.swift
//  Tournament
//
//  Created by Danny on 11/9/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

class ProMatch: Codable {
    let matchId: Int
    let duration: Int
    let startTime: Int
    let radiantTeamId: Int?
    let radiantName: String?
    let direTeamId: Int?
    let direName: String?
    let leagueid: Int
    let leagueName: String
    let seriesId: Int
    let seriesType: Int
    let radiantScore: Int
    let direScore: Int
    let radiantWin: Bool
}
