//
//  GenericError.swift
//  Tournament
//
//  Created by Danny on 11/16/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation

enum GenericError: Error {
    case unknown
}

extension GenericError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unknown:
            return NSLocalizedString("An unknown error has occured.", comment: "Could be connectivity")
        }
    }
}
