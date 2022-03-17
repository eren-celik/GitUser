//
//  Router+Contracts.swift
//  gu
//
//  Created by Eren  Çelik on 17.03.2022.
//

import Foundation

protocol RouterProtocol: Presentable {
    
    func present(_ module: Presentable?)
    func push(_ module: Presentable?)
    func dismissModule()
    func setRootModule(_ module: Presentable?)
    func popModule()
    func popToModule(module: Presentable?, animated: Bool)
}
