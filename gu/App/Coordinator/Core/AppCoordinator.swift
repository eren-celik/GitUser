//
//  AppCoordinator.swift
//  gu
//
//  Created by Eren  Çelik on 4.03.2022.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    
    unowned let window: UIWindow
    private let rootViewController: UINavigationController
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let router: RouterProtocol
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        router = Router(rootController: rootViewController)
        coordinatorFactory = CoordinatorFactory()
    }
    
    override func start() {
        window.rootViewController = rootViewController
        let coordinator = coordinatorFactory.makeMainCoordinator(router: router,
                                                                 coordinatorFactory: coordinatorFactory)
        self.addDependency(coordinator)
        coordinator.start()
        window.makeKeyAndVisible()
    }
}
