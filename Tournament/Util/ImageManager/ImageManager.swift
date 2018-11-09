//
//  ImageManager.swift
//  MoviesExample
//
//  Created by Danny on 10/31/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class ImageManager {
    let imageCache = AutoPurgingImageCache(
        memoryCapacity: UInt64(100).megabytes(),
        preferredMemoryUsageAfterPurge: UInt64(60).megabytes()
    )
    
    let decodeQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.underlyingQueue = DispatchQueue(label: "com.image.queue", attributes: .concurrent)
        queue.maxConcurrentOperationCount = 4
        return queue
    }()
    
    func retrieveImage(for url: String, completion: @escaping (UIImage) -> Void) -> ImageRequest {
        let queue = decodeQueue.underlyingQueue
        let request = Alamofire.request(url, method: .get)
        let imageRequest = ImageRequest(request: request)
        let serializer = DataRequest.imageResponseSerializer()
        imageRequest.request.response(queue: queue, responseSerializer: serializer) { response in
            guard let image = response.result.value else { return }
            imageRequest.decodeOperation = self.decode(image) { image in
                completion(image)
                self.cache(image, for: url)
            }
        }
        return imageRequest
    }
    
    //MARK: - Image Caching
    
    func cache(_ image: Image, for url: String) {
        imageCache.add(image, withIdentifier: url)
    }
    
    func cachedImage(for url: String) -> Image? {
        return imageCache.image(withIdentifier: url)
    }
    
    //MARK: - Image Decoding
    
    func decode(_ image: UIImage, completion: @escaping (UIImage) -> Void) -> DecodeOperation {
        let operation = DecodeOperation(image: image, completion: completion)
        decodeQueue.addOperation(operation)
        return operation
    }
}
