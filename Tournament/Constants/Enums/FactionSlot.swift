//
//  PlayerSlot.swift
//  Dota Central
//
//  Created by Danny on 8/30/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

enum Radiant: Int {
    case slotZero = 0
    case slotOne
    case slotTwo
    case slotThree
    case slotFour
}
enum Dire: Int {
    case slotZero = 128
    case slotOne
    case slotTwo
    case slotThree
    case slotFour
}

enum FactionSlot {
    case radiant(Radiant)
    case dire(Dire)
    
    static func build(rawValue: Int) -> FactionSlot {
        if rawValue >= 0 && rawValue <= 4 {
            let slot = Radiant(rawValue: rawValue) ?? .slotOne
            return .radiant(slot)
        }
        else {
            let slot = Dire(rawValue: rawValue) ?? .slotOne
            return .dire(slot)
        }
    }
}
