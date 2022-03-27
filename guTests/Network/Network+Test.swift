//
//  Network+Test.swift
//  guTests
//
//  Created by Eren  Çelik on 6.03.2022.
//

import XCTest
import Moya
@testable import gu

final class NetworkTest: XCTestCase {
    
    var manager: NetworkManager!
    var provider: MoyaProvider<GuAPI>!
    
    override func setUp() {
        super.setUp()
        manager = NetworkManager()
    }
    
    override func tearDown() {
        manager = nil
        provider = nil
        super.tearDown()
    }
    
    func test_network_getusers_shouldBeUsers() {
        
        /// Given
        provider = StubProvider.succes.provider
        manager.provider = provider
        var users: GitUsers?

        /// When
        manager.getUsers(perPage: 1) { (result) in
            switch result {
            case .success(let userResult):
                users = userResult
            case .failure(_):
                users = nil
                break
            }
        }

        ///Then
        XCTAssertNotNil(users)
        XCTAssertEqual(users?.first?.id, 1)
        XCTAssertEqual(users?.first?.type, "User")
    }
    
    func test_network_getusers_shouldBeGetEmptyData() {
        /// Given
        provider = StubProvider.empty.provider
        manager.provider = provider
        var error: GUNetworkErrors?
        
        /// When
        manager.getUsers(perPage: 1) { (result) in
            switch result {
            case .success(_):
                error = nil
            case .failure(let errorResponse):
                error = errorResponse
                break
            }
        }
        
        ///Then
        XCTAssertNotNil(error)
        XCTAssertEqual(error?.localizedDescription, "Decode Error")
    }
    
    func test_network_getusers_getNetworkError() {
        /// Given
        provider = StubProvider.networkError.provider
        manager.provider = provider
        var error: GUNetworkErrors?
        
        /// When
        manager.getUsers(perPage: 1) { (result) in
            switch result {
            case .success(_):
                error = nil
            case .failure(let errorResponse):
                error = errorResponse
                break
            }
        }
        
        ///Then
        XCTAssertNotNil(error)
        XCTAssertEqual(error?.localizedDescription, "Network Error Code:404")
    }
    
    func test_network_getusers_shouldBeFail() {
        /// Given
        provider = StubProvider.error.provider
        manager.provider = provider
        var error: GUNetworkErrors?
        
        /// When
        manager.getUsers(perPage: 1) { (result) in
            switch result {
            case .success(_):
                error = nil
            case .failure(let errorResponse):
                error = errorResponse
                break
            }
        }
        
        ///Then
        XCTAssertNotNil(error)
        XCTAssertEqual(error?.localizedDescription, "Invalid Response: Invalid Input")
    }
}
