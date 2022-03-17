//
//  MainView+Coordinator.swift
//  gu
//
//  Created by Eren  Çelik on 4.03.2022.
//

import Foundation
import UIKit

final class MainCoordinator: ViewCoordinatorProtocol {
    
    var finishFlow: (() -> Void)?
    
    private let router: RouterProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    
    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    func showMain() {
        let manager = NetworkManager()
        let vc = MainViewController.instantiate()
        vc.coordinator = self
        let vm = MainViewViewModel(network: manager)
        vc.viewModel = vm
        
        self.router.setRootModule(vc)
    }
    
    func showDetail() {
        let vc = DetailViewController.instantiate()
        let coord = self.coordinatorFactory.makeDetailCoordinator(router: router)
        coord.finishFlow = { [weak self, unowned coord] in
            self?.removeDependency(coord)
            self?.router.popToModule(module: vc, animated: true)
        }
        self.addDependency(coord)
        coord.start()
    }
    
    override func dismiss() {
        finishFlow?()
    }
    
    override func start() {
        showMain()
    }
}
