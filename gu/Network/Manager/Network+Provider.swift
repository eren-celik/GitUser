//
//  Network+Provider.swift
//  gu
//
//  Created by Eren  Çelik on 4.03.2022.
//

import Moya

enum GuAPI {
    case users(perPage: Int)
}

extension GuAPI: TargetType {
    
    var baseURL: URL {
        switch self {
        case .users:
            return URL(string: Constants.baseURL)!
        }
    }
    
    var path: String {
        switch self {
        case .users:
            return "/users"
        }
    }
    
    var method: Method {
        switch self {
        case .users:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .users(let perPage):
            return.requestParameters(parameters: ["per_page": perPage], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .users:
            return ["Content-Type": "application/json; charset=utf-8"]
        }
    }
    
    var sampleData: Data {
        switch self {
        case .users:
            return DataFixtures.validUserListData
        }
    }
}

class DataFixtures {
    
    static var validUserListData: Data { return jsonData("git_users_mock") }

    private static func jsonData(_ filename: String) -> Data {
        
        if let filepath = Bundle.main.path(forResource: filename, ofType: "json") {
            do {
                let contents = try String(contentsOfFile: filepath, encoding: .utf8)
                return contents.data(using: .utf8) ?? Data()
            } catch {
                print("null")
            }
        } else {
            print("nullda")
        }
        return Data()
    }
}
