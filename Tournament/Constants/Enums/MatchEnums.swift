//
//  MatchEnums.swift
//  Dota Central
//
//  Created by Danny on 8/29/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

enum LeaverStatus: Int {
    case didNotLeave = 0
    case leftSafely
    case abandoned
    
    static func build(rawValue: Int) -> LeaverStatus {
        return LeaverStatus(rawValue: rawValue) ?? .abandoned
    }
    
    var description: String {
        get {
            switch self {
            case .didNotLeave:
                return "Didn't leave"
            case .leftSafely:
                return "Left safely"
            case .abandoned:
                return "Abandoned"
            }
        }
    }
}

enum SkillLevel: Int, Codable {
    case normal = 1, high, veryHigh
    
    var description: String {
        get {
            switch self {
            case .normal:
                return "Normal Skill"
            case .high:
                return "High Skill"
            case .veryHigh:
                return "Very High"
            }
        }
    }
}
