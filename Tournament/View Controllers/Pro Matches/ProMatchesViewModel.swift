//
//  ProMatchesViewModel.swift
//  Tournament
//
//  Created by Danny on 11/9/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxSwiftUtilities


class ProMatchesViewModel {
    private let proMatchesSubject = PublishSubject<[ProMatchObjectViewModel]>()
    private let disposeBag = DisposeBag()
    
    let proMatchesData: Driver<[ProMatchObjectViewModel]>
    let activityIndicator = ActivityIndicator()
    
    // MARK: - Constructor
    
    init() {
        proMatchesData = proMatchesSubject.asDriver(onErrorJustReturn: [])
        fetchProMatches()
    }
    
    // MARK: - API
    
    private func fetchProMatches() {
        guard let url = URL(string: OpenDotaUrlConstants.baseProMatchesUrl) else {
            proMatchesSubject.onNext([])
            return
        }
        let request = URLRequest(url: url)
        GenericRestService<[ProMatch]>
            .fetchData(withURLRequest: request)
            .flatMap { (proMatches) -> Observable<[ProMatchObjectViewModel]> in
                let objectViewModels = proMatches.map({ (match) -> ProMatchObjectViewModel in
                    return ProMatchObjectViewModel(withBaseObject: match)
                })
                return Observable.just(objectViewModels)
            }
            .trackActivity(activityIndicator)
            .bind(to: proMatchesSubject)
            .disposed(by: disposeBag)
    }
}
