//
//  Network+Manager.swift
//  gu
//
//  Created by Eren  Çelik on 5.03.2022.
//

import Moya

enum GUNetworkErrors: Error {
    
    case invalidResponse(message: String)
    case decodeError
    case networkError(code: Int)
    
    var localizedDescription: String {
        switch self {
        case .invalidResponse(let message):
            return "Invalid Response: \(message)"
        case .decodeError:
            return "Decode Error"
        case .networkError(let code):
            return "Network Error Code:\(code)"
        }
    }
}

final class NetworkManager: NetworkLayerProtocol {
    typealias TargetType = GuAPI
    var provider: MoyaProvider<GuAPI>
    
    init(provider: MoyaProvider<TargetType> = MoyaProvider<TargetType>()) {
        self.provider = provider
    }
}

extension NetworkManager: NetworkRequestProtocol {
    
    func getUsers(perPage: Int, completion: @escaping (Result<GitUsers, GUNetworkErrors>) -> Void) {
        request(target: .users(perPage: perPage), completion: completion)
    }
}

//MARK: - General Request Extension

extension NetworkManager {
    
    func request<T: Decodable>(target: TargetType, completion: @escaping (Result<T, GUNetworkErrors>) -> Void) {
        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                guard response.statusCode >= 200 && response.statusCode <= 300 else {
                    completion(.failure(.networkError(code: response.statusCode)))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(result))
                }catch {
                    completion(.failure(.decodeError))
                }
                break
            case .failure(let error):
                completion(.failure(.invalidResponse(message: error.localizedDescription)))
            }
        }
    }
}
