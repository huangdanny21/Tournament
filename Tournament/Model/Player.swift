//
//  Player.swift
//  Tournament
//
//  Created by Danny on 11/14/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

class MMREstimateResponseBody: Codable {
    let estimate: Int?
}

class Profile: Codable {
    let accountId: Int
    let personaname: String?
    let name: String?
    let steamId: String?
    let avatar: String?
    let avatarmedium: String?
    let profileurl: String?
    let lastLogin: String?
}

class Player: Codable {
    let soloCompetitiveRank: Int?
    let rankTier: Int?
    let mmrEstimate: MMREstimateResponseBody?
    let leaderboardRank: Int?
    let profile: Profile
    let competitiveRank: Int?
}
