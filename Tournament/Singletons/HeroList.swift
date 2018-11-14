//
//  HeroList.swift
//  Dota Central
//
//  Created by Danny on 8/31/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

class HeroList {
    private var heros = [String: Hero]()
    private init() {}
    static let shared = HeroList()
    
    // MARK: - Setters
    
    func setHeroes(withHeroes heroList: [Hero]) {
        var heroesList = [String: Hero]()
        heroList.forEach { (hero) in
            heroesList["\(hero.id)"] = hero
        }
        heros = heroesList
    }
    
    // MARK: - Getters
    
    func getHero(forId id: String) -> Hero? {
        guard let hero = heros[id] else {
            return nil
        }
        return hero
    }
}
