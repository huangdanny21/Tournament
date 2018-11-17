//
//  MatchDetailViewModel.swift
//  Tournament
//
//  Created by Danny on 11/16/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import RxSwift
import RxCocoa
import RxSwiftExt

struct MatchDetailViewModel {
    struct Inputs {
        let viewAppearTrigger: Observable<Void>
    }
    
    // Output
    
    let matchDetailObjectViewModel: Driver<MatchDetailObjectViewModel>
    let errorMessage: Driver<String>
}

extension MatchDetailViewModel {
    init(_ inputs: Inputs, _ matchId: Int, dataTask: @escaping DataTask, decoder: JSONDecoder = JSONDecoder()) {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let networkResponse = inputs.viewAppearTrigger
            .map{URLRequest.matchDetail(withMatchid: matchId) }
            .flatMapLatest {dataTask($0)}
            .share()
        
        
        let matchDetailResponse = networkResponse
            .map{ $0.successResponse }
            .unwrap()
        
        let error = networkResponse
            .map{ $0.failureResponse }
            .unwrap()
            .map{ $0.localizedDescription}
        
        let failure = matchDetailResponse
            .filter { $0.1.statusCode / 100 != 2 }
            .map { "There was a server error (\($0))" }
        
        let matchDetail = matchDetailResponse
            .filter{$0.1.statusCode / 100 == 2}
            .map {try decoder.decode(MatchDetail.self, from: $0.0)}
        
        matchDetailObjectViewModel = matchDetail
            .map{MatchDetailObjectViewModel(withBaseObject: $0)}
            .asDriverLogError()
        
        errorMessage = Observable.merge(error, failure)
            .asDriverLogError()
    }
}
