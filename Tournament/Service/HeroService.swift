//
//  HeroService.swift
//  Tournament
//
//  Created by Danny on 11/14/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import RxSwift

class HeroService {
    @discardableResult class func getHeroList() -> Observable<[Hero]> {
        guard let url = URL(string: "https://api.opendota.com/api/heroes") else {
            return Observable.just([])
        }
        let request = URLRequest(url: url)
        return GenericRestService<[Hero]>
            .fetchData(withURLRequest: request)
    }
}
