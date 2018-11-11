//
//  League.swift
//  Tournament
//
//  Created by Danny on 11/10/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

class League: Codable {
    let leagueid: Int
    let ticket: String?
    let banner: String?
    let tier: String
    let name: String
}
