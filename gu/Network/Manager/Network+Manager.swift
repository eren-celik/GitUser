//
//  Network+Manager.swift
//  gu
//
//  Created by Eren  Çelik on 5.03.2022.
//

import Moya

final class NetworkManager: NetworkLayerProtocol {
    var provider: MoyaProvider<GuAPI>
    typealias TargetType = GuAPI
    
    init(provider: MoyaProvider<TargetType> = MoyaProvider<TargetType>()) {
        self.provider = provider
    }
}

extension NetworkManager: NetworkRequestProtocol {
    
    func getUsers(perPage: Int, completion: @escaping (Result<GitUsers, Error>) -> Void) {
        request(target: .users(perPage: perPage), completion: completion)
    }
}
