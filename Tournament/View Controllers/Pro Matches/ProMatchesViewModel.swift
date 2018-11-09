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
    private let proMatchesSubject = PublishSubject<[ProMatch]>()
    private let disposeBag = DisposeBag()
    
    let proMatchesData: Driver<[ProMatch]>
    
    // MARK: - Constructor
    
    init() {
        proMatchesData = proMatchesSubject.asDriver(onErrorJustReturn: [])
        fetchProMatches()
    }
    
    // MARK: - API
    
    private func fetchProMatches() {
        guard let url = URL(string: OpenDotaUrlConstants.proMatchesUrl) else {
            proMatchesSubject.onNext([])
            return
        }
        let urlRequest = URLRequest(url: url)
        GenericRestService<[ProMatch]>
            .fetchData(withURLRequest: urlRequest)
            .bind(to: proMatchesSubject)
            .disposed(by: disposeBag)
    }
}
