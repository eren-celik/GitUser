//
//  Network+Contracts.swift
//  gu
//
//  Created by Eren  Çelik on 5.03.2022.
//

import Moya
import Alamofire

protocol NetworkLayerProtocol {
    
    var provider: MoyaProvider<GuAPI> { get }
    
    func getUsers(perPage: Int, completion: @escaping (Result<GitUsers, Error>) -> Void)
}

protocol NetworkRequestProtocol: AnyObject {
    associatedtype TargetType
    
    func request<T: Decodable>(target: TargetType, completion: @escaping (Result<T, Error>) -> Void)
}

extension NetworkRequestProtocol where Self: NetworkLayerProtocol {
    
    internal func request<T: Decodable>(target: GuAPI, completion: @escaping (Result<T, Error>) -> Void) {
        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                guard response.statusCode >= 200 && response.statusCode <= 300 else {
                    completion(.failure(NSError(domain: "com", code: response.statusCode, userInfo: [:])))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(result))
                }catch let error {
                    completion(.failure(error))
                }
                break
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
