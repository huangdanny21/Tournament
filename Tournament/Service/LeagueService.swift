//
//  LeagueService.swift
//  Tournament
//
//  Created by Danny on 11/9/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

protocol LeagueService_Protocol {
    func leagueList() -> Observable<[League]>
}

class LeagueService: LeagueService_Protocol {
    private let httpClient: HTTPClient_Protocol
    private let jsonDecoder: JSONDecoder
    
    // MARK: - Constructor
    
    init(httpClient: HTTPClient_Protocol = HTTPClient()) {
        self.httpClient = httpClient
        self.jsonDecoder = JSONDecoder()
        //self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    // MARK: - Protocol

    func leagueList() -> Observable<[League]> {
        
    }
    
//    func search(forQuery query: String, pageNumber: Int, completion: @escaping (Result<SearchResult>) -> Void) {
//        let urlString = ServiceConstants.fullFlickrSearchUrl(withQuery: query, pageNumber: pageNumber)
//        guard let url = URL(urlString) else {
//            // Do some kind of error here
//            return
//        }
//        let request = HTTPRequest(url: url)
//        httpClient.send(request: request) { (result) in
//            switch result {
//            case let .success(value):
//                completion(Result(value: {try self.jsonDecoder.decode(SearchResponseBody.self, from: value).photos}))
//            case let .failure(error):
//                completion(.failure(error))
//            }
//        }
//    }
}
