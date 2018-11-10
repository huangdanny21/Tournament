//
//  MatchDetailViewModel.swift
//  Tournament
//
//  Created by Danny on 11/9/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MatchDetailViewModel {
    private let matchDetailSubject = PublishSubject<MatchDetailObjectViewModel>()
    private let disposeBag = DisposeBag()
    
    let matchDetailData: Single<MatchDetailObjectViewModel>
    
    // MARK: - Constructor
    
    init(withMatchId matchId: Int) {
        matchDetailData = matchDetailSubject.asSingle()
        fetchMatchDetail(withMatchId: matchId)
    }
    
    // MARK: - API
    
    private func fetchMatchDetail(withMatchId matchId: Int) {
        guard let url = URL(string: OpenDotaUrlConstants.baseMatchUrl+"\(matchId)") else {
            matchDetailSubject.onError(ServiceError.invalidUrl)
            return
        }
        let request = URLRequest(url: url)
        GenericRestService<MatchDetail>
            .fetchData(withURLRequest: request)
            .flatMap { (matchDetail) -> Observable<MatchDetailObjectViewModel> in
                let objectViewModel = MatchDetailObjectViewModel(withBaseObject: matchDetail)
                return Observable.just(objectViewModel)
            }
            .bind(to: matchDetailSubject)
            .disposed(by: disposeBag)
    }
    
}

