//
//  HTTPResponseHandler.swift
//  SimpleFlickr
//
//  Created by Danny on 10/31/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation
import Alamofire

protocol HTTPResponseHandler_Protocol {
    func handle(dataResponse: DefaultDataResponse) -> Result<Data>
}

struct HTTPResponseHandler: HTTPResponseHandler_Protocol {
    func handle(dataResponse: DefaultDataResponse) -> Result<Data> {
        if dataResponse.error != nil {
            return .failure(HTTPError.invalidResponse)
        } else if let statusCode = dataResponse.response?.statusCode, statusCode >= 400 {
            return .failure(HTTPError.statusCode(statusCode))
        } else if let data = dataResponse.data {
            return .success(data)
        } else {
            return .failure(HTTPError.emptyResponse)
        }
    }
}
