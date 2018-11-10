//
//  BaseObjectViewModel.swift
//  Tournament
//
//  Created by Danny on 11/9/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

class BaseObjectViewModel<T> {
    private let baseObject: T
    public var object: T {
        get {
            return baseObject
        }
    }
    
    // MARK: - Constructor
    
    init(withBaseObject baseObject: T) {
        self.baseObject = baseObject
    }
}
