//
//  Coordinator+Protocols.swift
//  gu
//
//  Created by Eren  Çelik on 4.03.2022.
//

import UIKit

typealias ViewCoordinatorProtocol = BaseCoordinator & CoordinatorFinishOutput
typealias BaseCoordinatorProtocol = CoordinatorCoreProtocol & Coordinator

protocol CoordinatorCoreProtocol {
    var childCoordinators: [Coordinator] { get }
    
    func addDependency(_ coordinator: Coordinator)
    func removeDependency(_ coordinator: Coordinator?)
}

protocol Coordinator: AnyObject {
    func start()
    func dismiss()
}

protocol CoordinatorFinishOutput {
    var finishFlow: (() -> Void)? { get set }
}
