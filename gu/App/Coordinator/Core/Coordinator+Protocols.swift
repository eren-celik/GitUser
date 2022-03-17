//
//  Coordinator+Protocols.swift
//  gu
//
//  Created by Eren  Çelik on 4.03.2022.
//

import UIKit

protocol Coordinator: AnyObject {
    func start()
    func dismiss()
}

protocol CoordinatorFinishOutput {
    var finishFlow: (() -> Void)? { get set }
}

typealias ViewCoordinatorProtocol = BaseCoordinator & CoordinatorFinishOutput 
