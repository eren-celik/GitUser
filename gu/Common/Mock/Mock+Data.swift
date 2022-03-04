//
//  Mock+Data.swift
//  gu
//
//  Created by Eren  Çelik on 5.03.2022.
//

import Foundation

fileprivate enum MockDataFiles {
    
    case users
    
    var name: String {
        switch self {
        case .users:
            return "git_users_mock"
        }
    }
}

struct MockData {
    
    static var validUsersData: Data { return jsonData(.users) }

    private static func jsonData(_ file: MockDataFiles) -> Data {
        guard let filepath = Bundle.main.path(forResource: file.name, ofType: "json") else { return Data() }
        do {
            let contents = try String(contentsOfFile: filepath, encoding: .utf8)
            return contents.data(using: .utf8) ?? Data()
        } catch let error {
            print("Error", error.localizedDescription)
            return Data()
        }
    }
}
