//
//  League.swift
//  Tournament
//
//  Created by Danny on 11/9/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

class League: Codable {
    let leagueid: Int
    var ticket: String?
    var banner: String?
    let tier: String
    let name: String
}
