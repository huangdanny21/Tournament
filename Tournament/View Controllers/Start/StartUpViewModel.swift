//
//  StartUpViewModel.swift
//  Tournament
//
//  Created by Danny on 11/14/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import RxSwift
import RxCocoa

struct StartUpViewModel {
    
    // Output
    let toHome: Driver<Void>
}

extension StartUpViewModel {
    init() {
        toHome = Observable
            .zip(HeroService.getHeroList(), ItemService.getLocalItems())
            .map { (result) -> Void in
                HeroList.shared.setHeroes(withHeroes: result.0)
                ItemList.shared.setItems(withItems: result.1)
            }
            .asDriverLogError()
        
    }
}
