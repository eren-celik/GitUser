//
//  DetailViewCoordinator.swift
//  gu
//
//  Created by Eren  Çelik on 6.03.2022.
//

import UIKit

final class DetailViewCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = [Coordinator]()
    unowned let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = DetailViewController.instantiate()
        navigationController.pushViewController(vc, animated: false)
    }
}
