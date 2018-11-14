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
import RxSwiftUtilities

class MatchDetailViewModel {
    private let matchDetailSubject = PublishSubject<MatchDetailObjectViewModel>()
    private let disposeBag = DisposeBag()
    
    let matchDetailData: Observable<MatchDetailObjectViewModel>
    let activityIndicator = ActivityIndicator()

    // MARK: - Constructor
    
    init(withMatchId matchId: Int) {
        matchDetailData = matchDetailSubject.asObservable()
        fetchMatchDetail(withMatchId: matchId)
    }
    
    // MARK: - API
    
    func fetchMatchDetail(withMatchId matchId: Int) {
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

