//
//  Mock+Endpoints.swift
//  guTests
//
//  Created by Eren  Çelik on 6.03.2022.
//

import Moya
@testable import gu

struct CustomNetworkEndpoints {
    
    static let successEndpoint: (GuAPI) -> Endpoint =  { (target: GuAPI) -> Endpoint in
        return Endpoint(url: URL(target: target).absoluteString,
                        sampleResponseClosure: { .networkResponse(200, target.sampleData)},
                        method: target.method,
                        task: target.task,
                        httpHeaderFields: target.headers)
    }
    
    static let errorEndpoint: (GuAPI) -> Endpoint =  { (target: GuAPI) -> Endpoint in
        let error = NSError(domain: "com.erenccelik.gu", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid Input"])
        return Endpoint(url: URL(target: target).absoluteString,
                        sampleResponseClosure: { .networkError(error)},
                        method: target.method,
                        task: target.task,
                        httpHeaderFields: target.headers)
    }
    
    static let emptyDataClosure: (GuAPI) -> Endpoint =  { (target: GuAPI) -> Endpoint in
        return Endpoint(url: URL(target: target).absoluteString,
                        sampleResponseClosure: { .networkResponse(204, Data()) },
                        method: target.method,
                        task: target.task,
                        httpHeaderFields: target.headers)
    }
    
    static let networkErrorClosure: (GuAPI) -> Endpoint =  { (target: GuAPI) -> Endpoint in
        return Endpoint(url: URL(target: target).absoluteString,
                        sampleResponseClosure: { .networkResponse(404, Data()) },
                        method: target.method,
                        task: target.task,
                        httpHeaderFields: target.headers)
    }
}
