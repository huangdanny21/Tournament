//
//  LeagueService.swift
//  Tournament
//
//  Created by Danny on 11/9/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation
import RxSwift

protocol LeagueService_Protocol {
    func leagueList() -> Single<[League]>
}

class LeagueService: LeagueService_Protocol {
    private let jsonDecoder: JSONDecoder
    
    // MARK: - Constructor
    
    init() {
        self.jsonDecoder = JSONDecoder()
        //self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    // MARK: - Protocol

    func leagueList() -> Single<[League]> {
        guard let url = URL(string: OpenDotaUrlConstants.leagueListUrl) else {
            return Single.just([])
        }
        let urlRequest = URLRequest(url: url)
        return GenericRestService<[League]>.fetchData(withURLRequest: urlRequest).asSingle()
    }
}
