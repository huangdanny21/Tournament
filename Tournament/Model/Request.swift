//
//  Request.swift
//  Tournament
//
//  Created by Danny on 11/16/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

extension URLRequest {
    static func playerInfo(forAccountId accountId: Int) -> URLRequest {
        let url = URL(string: "https://api.opendota.com/api/players/\(accountId)")!
        return URLRequest(url: url)
    }
    
    static func matchDetail(withMatchid matchId: Int) -> URLRequest {
        let url = URL(string: "https://api.opendota.com/api/matches/\(matchId)")!
        return URLRequest(url: url)
    }
    
    static let proMatches: URLRequest = {
        let url = URL(string: "https://api.opendota.com/api/proMatches")!
        return URLRequest(url: url)
    }()
    
    static let heroList: URLRequest = {
        let url = URL(string: "https://api.opendota.com/api/heroes")!
        return URLRequest(url: url)
    }()
}
