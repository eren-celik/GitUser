//
//  BaseViewController.swift
//  gu
//
//  Created by Eren  Çelik on 17.03.2022.
//

import UIKit
import JGProgressHUD

extension UIViewController {
    
    // MARK: - HUD
    func showHud(text: String, viewType: AlertStyle? = nil, show: Bool) {
        let hud = JGProgressHUD()
        hud.textLabel.text = text
        hud.indicatorView = viewType?.view
        
        hud.shadow = JGProgressHUDShadow(color: .black,
                                         offset: .zero,
                                         radius: 5.0,
                                         opacity: 0.2)
        if show {
            hud.show(in: self.view)
        }else {
            hud.dismiss()
        }
    }
}
