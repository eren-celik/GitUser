//
//  Router+Test.swift
//  guTests
//
//  Created by Eren  Çelik on 29.03.2022.
//

@testable import gu
import XCTest

class RouterTest: XCTestCase {
    
    var mockNav: MockNavigationController!
    var router : Router!
    var vc: StubViewController!
    
    override func setUp() {
        mockNav = MockNavigationController()
        router = Router(rootController: mockNav)
    }
    
    override func tearDown() {
        mockNav = nil
        router = nil
        vc = nil
    }
    
    func test_router_present() {
        // Given
        vc = StubViewController()
        // When
        router.present(vc)
        // Then
        XCTAssertEqual(mockNav.pushedController, vc)
    }
    
    func test_router_push() {
        // Given
        vc = StubViewController()
        // When
        router.push(vc)
        // Then
        XCTAssertEqual(mockNav.pushedController, vc)
    }
    
    func test_router_dismiss() {
        router.dismissModule()
        
        XCTAssertTrue(mockNav.dismiss!)
    }
    
    func test_router_setRoot() {
        // Given
        vc = StubViewController()
        // When
        router.setRootModule(vc)
        // Then
        let rootVC = mockNav.viewControllers.first
        XCTAssertEqual(rootVC, vc)
    }
    
    func test_router_pop() {
        router.popModule()
        
        XCTAssertTrue(mockNav.poped!)
    }
    
    func test_router_popToVC() {
        // Given
        vc = StubViewController()
        let vc1 = UIViewController()
        
        // When
        mockNav.setViewControllers([vc, vc1], animated: false)
        router.popToModule(module: vc)
        
        // Then
        XCTAssertEqual(mockNav.pushedController, vc)
    }
}

final class StubViewController: UIViewController {}

final class MockNavigationController: UINavigationController {
    
    var pushedController: UIViewController?
    var dismiss: Bool?
    var poped: Bool?
    
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedController = viewController
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        pushedController = viewControllerToPresent
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        dismiss = true
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        poped = true
        return nil
    }
    
    override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        pushedController = viewController
        return nil
    }
}
