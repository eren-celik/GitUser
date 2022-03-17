//
//  Presentable.swift
//  gu
//
//  Created by Eren  Çelik on 17.03.2022.
//

import UIKit

protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
    
    func toPresent() -> UIViewController? {
        return self
    }
}
