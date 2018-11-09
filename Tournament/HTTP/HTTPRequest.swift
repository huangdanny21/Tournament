//
//  HTTPRequest.swift
//  SimpleFlickr
//
//  Created by Danny on 10/31/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation
import Alamofire

struct HTTPRequest: URLRequestConvertible, Hashable {
    enum Method: String {
        case get = "GET"
    }
    
    let method: Method
    let url: URL
    
    init(url: URL, method: Method = .get) {
        self.method = method
        self.url = url
    }
    
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
