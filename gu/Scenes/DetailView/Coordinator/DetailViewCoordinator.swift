//
//  DetailViewCoordinator.swift
//  gu
//
//  Created by Eren  Çelik on 6.03.2022.
//

import UIKit

class DetailViewCoordinator: ViewCoordinatorProtocol {
    
    var finishFlow: (() -> Void)?
    
    private let router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    override func start() {
        let vc = DetailViewController.instantiate()
        vc.coordinator = self
        self.router.push(vc)
    }
    
    override func dismiss() {
        finishFlow?()
    }
}
