//
//  DetailViewCoordinator.swift
//  gu
//
//  Created by Eren  Çelik on 6.03.2022.
//

import UIKit

class DetailViewCoordinator: ViewCoordinatorProtocol {
    
    var finishFlow: (() -> Void)?
    var user: GitUser?
    
    private let router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    override func start() {
        let vc = DetailViewController.instantiate()
        let engine = FirebaseEngine()
        let manager = AnalyticsManager(engine: engine)
        
        vc.coordinator = self
        vc.user = user
        vc.analytics = manager
        
        self.router.push(vc)
    }
    
    override func dismiss() {
        finishFlow?()
    }
}
