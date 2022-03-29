//
//  BaseCoordinator+Test.swift
//  guTests
//
//  Created by Eren  Çelik on 29.03.2022.
//

@testable import gu
import XCTest

class BaseCoordinatorTest: XCTestCase {
    
    func test_Coordinator_shouldAddDependecy() {
        // Given
        let mockCoord = makeMockCoord()
        // When
        mockCoord.addTestCoordinator()
        // Then
        XCTAssertEqual(mockCoord.childCoordinators.count, 1)
    }
    
    func test_Coordinator_addCoordinator_shouldReturnEmpty() {
        // Given
        let mockCoord = makeMockCoord()
        // When
        mockCoord.addTestCoordinator()
        mockCoord.addTestCoordinator()
        // Then
        XCTAssertEqual(mockCoord.childCoordinators.count, 1)
    }
    
    func test_Coordinator_shouldRemoveDependecy() {
        // Given
        let mockCoord = makeMockCoord()
        // When
        mockCoord.addTestCoordinator()
        mockCoord.removeTestCoordinator()
        // Then
        XCTAssertEqual(mockCoord.childCoordinators.count, 0)
    }
    
    func test_Coordinator_removeCoordinator_shouldReturnEmpty() {
        // Given
        let mockCoord = makeMockCoord()
        // When
        mockCoord.removeTestCoordinator()
        mockCoord.removeTestCoordinator()
        // Then
        XCTAssertEqual(mockCoord.childCoordinators.count, 0)
    }
    
    
    func test_Coordinator_startCoordinator() {
        // Given
        let mockCoord = makeMockCoord()
        // When
        mockCoord.start()
        // Then
        XCTAssertTrue(mockCoord.invokedStart)
    }
    
    func test_Coordinator_dismissCoordinator() {
        // Given
        let mockCoord = makeMockCoord()
        // When
        mockCoord.dismiss()
        // Then
        XCTAssertTrue(mockCoord.invokedDismiss)
    }
    
    //MARK: Helpers
    
    fileprivate func makeMockCoord() -> MockCoordinator {
        let mock = MockCoordinator()
        return mock
    }
}

final fileprivate class MockCoordinator: ViewCoordinatorProtocol {
    
    var finishFlow: (() -> Void)?
    
    var invokedStart: Bool = false
    var invokedDismiss: Bool = false
    
    override func start() {
        invokedStart = true
    }
    
    override func dismiss() {
        invokedDismiss = true
    }
    
    func addTestCoordinator() {
        self.addDependency(self)
    }
    
    func removeTestCoordinator() {
        self.removeDependency(self)
    }
}
