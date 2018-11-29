//
//  BattleCupViewModel.swift
//  Tournament
//
//  Created by Danny on 11/25/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import RxSwift
import RxCocoa

struct BattleCupViewModel {
    struct Inputs {
        let createRequest: Observable<Void>
        //let refreshTrigger: Observable<Void>
        let viewAppearTrigger: Observable<Void>
    }
    
    // Outputs
    
    let toCreateRequest: Driver<Void>
}


extension BattleCupViewModel {
    init (_ inputs: Inputs) {
        toCreateRequest = inputs.createRequest.asDriverLogError()
    }
}
