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

class ProMatchesViewModel {
    private let proMatchesSubject = PublishSubject<[ProMatchObjectViewModel]>()
    private let disposeBag = DisposeBag()
    
    let proMatchesData: Driver<[ProMatchObjectViewModel]>
    
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
        let urlRequest = URLRequest(url: url)
        GenericRestService<[ProMatch]>
            .fetchData(withURLRequest: urlRequest)
            .flatMap { (proMatches) -> Observable<[ProMatchObjectViewModel]> in
                let objectViewModels = proMatches.map({ (match) -> ProMatchObjectViewModel in
                    return ProMatchObjectViewModel(withBaseObject: match)
                })
                return Observable.just(objectViewModels)
            }
            .bind(to: proMatchesSubject)
            .disposed(by: disposeBag)
    }
}
