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
    weak var parentCoordinator: MainCoordinator?
    var data: [String: Any]?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = DetailViewController.instantiate()
        vc.coordinator = self
        if let user = data?["user"] as? GitUser {
            vc.user = user
        }
        navigationController.pushViewController(vc, animated: false)
    }
    
    func dismiss() {
        parentCoordinator?.childDidFinish(self)
    }
}
