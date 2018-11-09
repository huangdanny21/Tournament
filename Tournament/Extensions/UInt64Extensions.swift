//
//  UInt64Extensions.swift
//  SimpleFlickr
//
//  Created by Danny on 10/31/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

extension UInt64 {
    func megabytes() -> UInt64 {
        return self * 1024 * 1024
    }
}
