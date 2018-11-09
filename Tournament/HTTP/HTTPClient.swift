//
//  HTTPClient.swift
//  SimpleFlickr
//
//  Created by Danny on 10/31/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation
import Alamofire

protocol SessionManager_Protocol {
    func request(_ request: URLRequestConvertible, completionHandler: @escaping (DefaultDataResponse) -> Void)
}

extension SessionManager: SessionManager_Protocol {
    func request(_ request: URLRequestConvertible, completionHandler: @escaping (DefaultDataResponse) -> Void) {
        self.request(request).response(completionHandler: completionHandler)
    }
}

protocol HTTPClient_Protocol {
    func send(request: HTTPRequest, completion: @escaping (Result<Data>) -> Void)
}

class HTTPClient: HTTPClient_Protocol {
    private let manager: SessionManager_Protocol
    private let responseHandler: HTTPResponseHandler_Protocol
    
    init(manager: SessionManager_Protocol = SessionManager.default,
         responseHandler: HTTPResponseHandler_Protocol = HTTPResponseHandler()) {
        self.manager = manager
        self.responseHandler = responseHandler
    }
    
    func send(request: HTTPRequest, completion: @escaping (Result<Data>) -> Void) {
        manager.request(request) { dataResponse in
            let result = self.responseHandler.handle(dataResponse: dataResponse)
            completion(result)
        }
    }
}
