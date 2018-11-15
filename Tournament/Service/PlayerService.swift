//
//  PlayerService.swift
//  Tournament
//
//  Created by Danny on 11/14/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import RxSwift

class PlayerService {
    @discardableResult class func getPlayer(forAccountId accountId: Int) -> Single<Player> {
        guard let url = URL(string: OpenDotaUrlConstants.basePlayerInfoUrl+"\(accountId)") else {
            return Single.error(ServiceError.invalidUrl)
        }
        let request = URLRequest(url: url)
        return GenericRestService<Player>
                .fetchData(withURLRequest: request)
                .asSingle()
    }
}
