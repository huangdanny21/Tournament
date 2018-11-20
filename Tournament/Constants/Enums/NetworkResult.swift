//
//  NetworkResult.swift
//  Tournament
//
//  Created by Danny on 11/18/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

enum NetworkResult<T: Any, E: Error> {
    case Success(data: T)
    case Failure(error: E)
}
