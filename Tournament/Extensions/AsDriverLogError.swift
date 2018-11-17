//
//  AsDriverLogError.swift
//  Tournament
//
//  Created by Danny on 11/16/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa

extension ObservableConvertibleType {
    public func asDriverLogError(_ file: StaticString = #file, _ line: UInt = #line) -> SharedSequence<DriverSharingStrategy, E> {
        return asDriver(onErrorRecover: { print("Error:", $0, " in file:", file, " atLine:", line); return .empty() })
    }
}
