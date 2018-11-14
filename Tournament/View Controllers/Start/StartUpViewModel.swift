//
//  StartUpViewModel.swift
//  Tournament
//
//  Created by Danny on 11/14/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import RxSwift
import RxCocoa

class StartUpViewModel {
    private let goToHomeSubject = PublishSubject<Void>()
    private let disposeBag = DisposeBag()
    let toHomeObservable: Observable<Void>

    // MARK: - Constructor
    
    init() {
        toHomeObservable = goToHomeSubject.asObserver()
        fetchData()
    }
    
    // MARK: - API
    
    private func fetchData() {
        Observable
            .zip(HeroService.getHeroList(), ItemService.getLocalItems())
            .subscribe(onNext: { (result) in
                print("success")
                HeroList.shared.setHeroes(withHeroes: result.0)
                ItemList.shared.setItems(withItems: result.1)
                self.goToHomeSubject.onNext(())
            }, onError: { (error) in
                print("failed")
                self.goToHomeSubject.onNext(())
            })
            .disposed(by: disposeBag)
        
    }
}
