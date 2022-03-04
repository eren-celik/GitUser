//
//  Coordinator+Protocols.swift
//  gu
//
//  Created by Eren  Çelik on 4.03.2022.
//

import UIKit

protocol BaseCoordinator {
    init(window: UIWindow)
    func start()
}

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    init(navigationController: UINavigationController)
    func start()
}
