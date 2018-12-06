//
//  BattleCupRequestViewModel.swift
//  Tournament
//
//  Created by Danny on 11/28/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import RxSwift
import RxCocoa

struct BattleCupRequestViewModel {
    struct Inputs {
        let steamIdText: Observable<String>
        let serverText: Observable<String>
        let tierText: Observable<String>
        let roleText: Observable<String>
        let otherInformationText: Observable<String>
    }
    
    // Outputs
    
    let enableSubmitButton: Driver<Bool>
    //let errorMessage: Driver<String>
    //let submitted: Driver<Void>
}

extension BattleCupRequestViewModel {
    init (_ inputs: Inputs) {
        let metadataObs = Observable.combineLatest(inputs.steamIdText, inputs.serverText, inputs.tierText, inputs.roleText, inputs.otherInformationText)
        
        enableSubmitButton = metadataObs
            .map{ !$0.0.isEmpty && !$0.1.isEmpty && !$0.2.isEmpty}
            .asDriverLogError()
        
    }
}
