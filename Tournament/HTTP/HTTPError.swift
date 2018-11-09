//
//  HTTPError.swift
//  SimpleFlickr
//
//  Created by Danny on 10/31/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

enum HTTPError: Error {
    case statusCode(Int)
    case invalidResponse
    case emptyResponse
}
