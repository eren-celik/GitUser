//
//  Coordinator+Factory.swift
//  gu
//
//  Created by Eren  Çelik on 17.03.2022.
//

import Foundation

protocol CoordinatorFactoryProtocol {
    func makeMainCoordinator(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol) -> MainCoordinator
    func makeDetailCoordinator(router: RouterProtocol) -> DetailViewCoordinator
}

final class CoordinatorFactory: CoordinatorFactoryProtocol {
    func makeMainCoordinator(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol) -> MainCoordinator {
        let coordinator = MainCoordinator(router: router, coordinatorFactory: coordinatorFactory)
        return coordinator
    }
    
    func makeDetailCoordinator(router: RouterProtocol) -> DetailViewCoordinator {
        let coordinator = DetailViewCoordinator(router: router)
        return coordinator
    }
}
