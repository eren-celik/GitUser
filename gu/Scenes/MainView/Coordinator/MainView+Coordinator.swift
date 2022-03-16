//
//  MainView+Coordinator.swift
//  gu
//
//  Created by Eren  Çelik on 4.03.2022.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator {

    var childCoordinators = [Coordinator]()
    unowned let navigationController: UINavigationController

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = MainViewController.instantiate()
        let manager = NetworkManager()
        let vm = MainViewViewModel(network: manager)
        vc.coordinator = self
        vc.viewModel = vm
        
        navigationController.delegate = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func dismiss() {}
    
    func userDetail(data: [String: Any]?) {
        let child = DetailViewCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.data = data
        child.start()
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController,
                              didShow viewController: UIViewController,
                              animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let buyViewController = fromViewController as? DetailViewController {
            childDidFinish(buyViewController.coordinator)
        }
    }
}
