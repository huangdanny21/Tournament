//
//  BattleCupMetadata.swift
//  Tournament
//
//  Created by Danny on 11/10/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

class BattleCupMetadata: Codable {
    let steamId: String
    let server: String
    let tier : Int
    let role: [Int]
    let otherInfo: String
}
