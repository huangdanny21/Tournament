//
//  ItemList.swift
//  Dota Central
//
//  Created by Danny on 9/1/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

class ItemList {
    private var itemList: [String: String]?
    private init() {}
    static let shared = ItemList()
    
    // MARK: - Setters
    
    func setItems(withItems itemList: [String: String]?) {
        self.itemList = itemList
    }
    
    // MARK: - Getters
    
    func getItemImageName(forId id: String) -> String? {
        guard let item = itemList?[id] else {
            return nil
        }
        return item
    }
}
