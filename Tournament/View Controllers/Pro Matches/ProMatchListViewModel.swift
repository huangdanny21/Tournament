//
//  ProMatchListViewModel.swift
//  Tournament
//
//  Created by Danny on 11/16/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import RxSwift
import RxCocoa
import RxSwiftExt

struct ProMatchListViewModel {
    struct Inputs {
        let selectMatch: Observable<IndexPath>
        let refreshTrigger: Observable<Void>
        let viewAppearTrigger: Observable<Void>
    }
    
    // Outputs
    
    let proMatchObjectViewModels: Driver<[ProMatchObjectViewModel]>
    let endRefreshing: Driver<Void>
    let errorMessage: Driver<String>
    
    let displayMatch: Driver<ProMatch>
}

extension ProMatchListViewModel {
    init(_ inputs: Inputs, dataTask: @escaping DataTask, decoder: JSONDecoder = JSONDecoder()) {
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let networkResponse = Observable.merge(inputs.refreshTrigger, inputs.viewAppearTrigger)
            .map { URLRequest.proMatches }
            .flatMapLatest{ dataTask($0) }
            .share()
        
        let proMatchesServerResponse = networkResponse
            .map { $0.successResponse }
            .unwrap()
        
        let error = networkResponse
            .map{ $0.failureResponse}
            .unwrap()
            .map{$0.localizedDescription}
        
        let failure = proMatchesServerResponse
            .filter { $0.1.statusCode / 100 != 2 }
            .map { "There was a server error (\($0))" }
        
        let proMatches = proMatchesServerResponse
            .filter { $0.1.statusCode / 100 == 2 }
            .map { try decoder.decode([ProMatch].self, from: $0.0) }
        
        proMatchObjectViewModels = proMatches
            .map {$0.map { ProMatchObjectViewModel(withBaseObject: $0) }}
            .asDriverLogError()
        
        endRefreshing = networkResponse
            .map{ _ in }
            .throttle(0.5, scheduler: MainScheduler.instance)
            .asDriverLogError()
        
        errorMessage = Observable.merge(error, failure)
            .asDriverLogError()
        
        displayMatch = inputs.selectMatch
            .withLatestFrom(proMatches) {$1[$0.row]}
            .asDriverLogError()
    }
}
