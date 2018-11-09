//
//  OpenDotaService.swift
//  Dota Central
//
//  Created by Danny on 8/28/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

enum ServiceError: Error {
    case decodingError
}

class GenericDecoder<OUT: Codable> {
    public class func fetchData(withURLRequest request: URLRequest) -> Observable<OUT> {
        fatalError("This method is empty please implement it on a subclass")
    }
}

class GenericRestService<OUT: Codable>: GenericDecoder<OUT>  {
    override class func fetchData(withURLRequest request: URLRequest) -> Observable<OUT> {
        return Observable.create({ (observer) -> Disposable in
            Alamofire
                .request(request)
                .responseJSON(completionHandler: { (response) in
                    switch response.result {
                    case .success(let json):
                        if let data = response.data {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            do {
                                let result = try decoder.decode(OUT.self, from: data)
                               observer.onNext(result)
                            }
                            catch {
                                print("JSON: \(json)")
                                observer.onError(error)
                            }
                        }
                        else {
                            observer.onError(ServiceError.decodingError)
                        }
                        
                    case.failure(let error):
                        observer.onError(error)
                    }
                })
            
            return Disposables.create()
        })
    }
}

