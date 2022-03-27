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
        let vm = MainViewViewModel(network: manager)
        
        vc.viewModel = vm
        vc.coordinator = self
        
        self.router.setRootModule(vc)
    }
    
    func showDetail(user: GitUser) {
        let coordiator = self.coordinatorFactory.makeDetailCoordinator(router: router)
        coordiator.finishFlow = { [weak self, unowned coordiator] in
            self?.removeDependency(coordiator)
        }
        self.addDependency(coordiator)
        coordiator.user = user
        coordiator.start()
    }
    
    override func dismiss() {
        finishFlow?()
    }
    
    override func start() {
        showMain()
    }
}
