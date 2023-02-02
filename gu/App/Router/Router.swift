//
//  Router.swift
//  gu
//
//  Created by Eren  Çelik on 17.03.2022.
//

import UIKit

final class Router: NSObject {
    
    private weak var rootController: UINavigationController?
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
        super.init()
    }
}

extension Router: RouterProtocol {
    
    // MARK: Presentable
    func toPresent() -> UIViewController? {
        return rootController
    }
    
    func present(_ module: Presentable?) {
        guard let controller = module?.toPresent() else { return }
        rootController?.present(controller, animated: true, completion: nil)
    }
    
    func push(_ module: Presentable?) {
        guard let controller = module?.toPresent() else { return }
        rootController?.pushViewController(controller, animated: true)
    }
    
    func dismissModule() {
        rootController?.dismiss(animated: true, completion: nil)
    }
    
    func setRootModule(_ module: Presentable?) {
        guard let controller = module?.toPresent() else { return }
        rootController?.setViewControllers([controller], animated: false)
    }
    
    func popModule() {
        rootController?.popViewController(animated: true)
    }
    
    func popToModule(module: Presentable?) {
        if let controllers = self.rootController?.viewControllers,
           let module = module?.toPresent() {
            for controller in controllers {
                if controller == module {
                    rootController?.popToViewController(controller, animated: true)
                    break
                }
            }
        }
    }
}
