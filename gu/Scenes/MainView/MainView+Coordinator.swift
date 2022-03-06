//
//  MainView+Coordinator.swift
//  gu
//
//  Created by Eren  Çelik on 4.03.2022.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    unowned let navigationController: UINavigationController

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = MainViewController.instantiate()
        navigationController.pushViewController(vc, animated: false)
    }
}
