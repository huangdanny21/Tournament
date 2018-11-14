//
//  ItemService.swift
//  Tournament
//
//  Created by Danny on 11/14/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import RxSwift

class ItemService {
    @discardableResult class func getLocalItems() -> Observable<[String: String]?> {
        let itemsDict = LocalJSONParser<[String: String]>
            .loadJson(filename: "item_ids")
        return Observable.just(itemsDict)
    }
}
