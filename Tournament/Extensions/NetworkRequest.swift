//
//  NetworkRequest.swift
//  Tournament
//
//  Created by Danny on 11/16/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import RxSwift
import RxCocoa
import RxSwiftUtilities

typealias DataTask = (URLRequest) -> Observable<NetworkResponse>

let isNetworkActive: Driver<Bool> = {
    return networkActivity.asDriver()
}()

func dataTask(with request: URLRequest) -> Observable<NetworkResponse> {
    return Observable.create { observer in
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let response = response as? HTTPURLResponse {
                observer.onNext(.success(data, response))
                observer.onCompleted()
            }
            else {
                observer.onNext(.failure(error ?? RxError.unknown))
                observer.onCompleted()
            }
        }
        task.resume()
        return Disposables.create { task.cancel() }
        }
        .trackActivity(networkActivity)
}

enum NetworkResponse {
    case success(Data, HTTPURLResponse)
    case failure(Error)
    
    var successResponse: (Data, HTTPURLResponse)? {
        if case let .success(data, response) = self {
            return (data, response)
        }
        return nil
    }
    
    var failureResponse: Error? {
        if case let .failure(error) = self {
            return error
        }
        return nil
    }
}

private
let networkActivity = ActivityIndicator()
