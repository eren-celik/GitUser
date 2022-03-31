//
//  UserModel+Tests.swift
//  guTests
//
//  Created by Eren  Çelik on 29.03.2022.
//

@testable import gu
import XCTest

class UserModelTests: XCTestCase {
    
    func test_getdata_response() throws {
        // Given
        let data = DummyData.validUsersData
        let response = try JSONDecoder().decode(GitUsers.self, from: data)
        
        // When
        
        let user = response.first!
        // Then
        
        XCTAssertEqual(response.count, 1)
        
        XCTAssertEqual(user.login, "mojombo")
        XCTAssertEqual(user.id, 1)
        XCTAssertEqual(user.avatarURL, "https://avatars.githubusercontent.com/u/1?v=4")
    }
}
