//
//  LeagueListViewModel.swift
//  Tournament
//
//  Created by Danny on 11/9/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class LeagueListViewModel {
    private let leagueListSubject = PublishSubject<[League]>()
    private let disposeBag = DisposeBag()
    
    let leagueListData: Driver<[League]>
    
    // MARK: - Constructor
    
    init() {
        leagueListData = leagueListSubject.asDriver(onErrorJustReturn: [])
        fetchLeagueList()
    }
    
    // MARK: - API
    
    private func fetchLeagueList() {
        guard let url = URL(string: OpenDotaUrlConstants.leagueListUrl) else {
            leagueListSubject.onNext([])
            return
        }
        let urlRequest = URLRequest(url: url)
        GenericRestService<[League]>
            .fetchData(withURLRequest: urlRequest)
            .bind(to: leagueListSubject)
            .disposed(by: disposeBag)
    }
}
