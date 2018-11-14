//
//  Hero.swift
//  Dota Central
//
//  Created by Danny on 8/27/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

enum Attribute: String, Codable {
    case agi
    case int
    case str
}

enum AttackType: String, Codable {
    case Melee
    case Ranged
}

class Hero: Codable {
    let id: Int
    let name: String
    let localizedName: String
    let primaryAttr: Attribute
    let attackType: AttackType
    let roles: [String]
    let legs: Int?
    
    // MARK: - Init
    
    init() {
        id = 0
        localizedName = ""
        name = ""
        primaryAttr = .agi
        attackType = .Melee
        roles = []
        legs = nil
    }
}
