//
//  Coordinator.swift
//  gu
//
//  Created by Eren  Çelik on 4.03.2022.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    
    unowned let window: UIWindow
    
    private let rootViewController: UINavigationController
    private var mainCoordinator: MainCoordinator?
    
    init(window: UIWindow) {
        self.window = window
        
        rootViewController = UINavigationController()
        mainCoordinator = MainCoordinator(navigationController: rootViewController)
    }
    
    func start() {
        window.rootViewController = rootViewController
        mainCoordinator?.start()
        window.makeKeyAndVisible()
    }
}

