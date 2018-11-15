//
//  Role.swift
//  Tournament
//
//  Created by Danny on 11/14/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

enum Lane: Int, Codable {
    case safelane = 1
    case midlane
    case offlane
    
    var description: String {
        get {
            switch self {
            case .safelane:
                return "Safelane"
            case .midlane:
                return "Midlane"
            case .offlane:
                return "Offlane"
            }
        }
    }
}
