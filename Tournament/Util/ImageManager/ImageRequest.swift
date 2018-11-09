//
//  ImageRequest.swift
//  MoviesExample
//
//  Created by Danny on 10/31/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Alamofire

class ImageRequest {
    var decodeOperation: Operation?
    var request: DataRequest
    
    init(request: DataRequest) {
        self.request = request
    }
    
    func cancel() {
        decodeOperation?.cancel()
        request.cancel()
    }
}
