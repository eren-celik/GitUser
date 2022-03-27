//
//  BaseViewController+Helpers.swift
//  gu
//
//  Created by Eren  Çelik on 17.03.2022.
//

import Foundation
import JGProgressHUD

enum AlertStyle {
    case success
    case error
    case loading
    
    var view: JGProgressHUDIndicatorView {
        switch  self {
        case .success:
            return JGProgressHUDSuccessIndicatorView()
        case .error:
            return JGProgressHUDSuccessIndicatorView()
        default:
            return JGProgressHUDIndicatorView()
        }
    }
}
