//
//  LocalJSONParser.swift
//  Dota Central
//
//  Created by Danny on 9/1/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

class LocalJSONParser<OUT: Codable> {
    class func loadJson(filename fileName: String) -> OUT? {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let result = try decoder.decode(OUT.self, from: data)
                return result
            } catch {
                return nil
            }
        }
        return nil
    }
}

