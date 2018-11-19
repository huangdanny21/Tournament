//
//  APIActivityIndicators.swift
//  Tournament
//
//  Created by Danny on 11/18/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import RxCocoa
import RxSwiftUtilities

let isFirebaseNetworkActive: Driver<Bool> = {
    return firestoreNetworkActivity.asDriver()
}()

let firestoreNetworkActivity = ActivityIndicator()
