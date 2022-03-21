//
//  BaseViewController.swift
//  gu
//
//  Created by Eren  Çelik on 17.03.2022.
//

import UIKit
import JGProgressHUD

class BaseViewController: UIViewController {
    
    private let hud = JGProgressHUD()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showHud(text: String? = "Loading",
                 viewType: AlertStyle? = nil,
                 show: Bool,
                 afterDismiss: TimeInterval? = nil) {
        hud.textLabel.text = text
        if viewType != nil {
            hud.indicatorView = viewType?.view
        }
        
        show ? hud.show(in: view) : hud.dismiss(animated: true)
        
        if afterDismiss != nil {
            hud.dismiss(afterDelay: afterDismiss!)
        }
    }
}
