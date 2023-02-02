//
//  Storyboarded.swift
//  gu
//
//  Created by Eren  Çelik on 4.03.2022.
//

import UIKit

protocol StoryboardInstantiable {
    static var storyboardName: String? { get }
    static var storyboardBundle: Bundle? { get }
    static var storyboardIdentifier: String? { get }
    static func instantiate() -> Self
}

extension StoryboardInstantiable where Self: UIViewController {
    
    static var storyboardName: String? { return NSStringFromClass(self) }
    static var storyboardBundle: Bundle? { return nil }
    static var storyboardIdentifier: String? { return NSStringFromClass(self)  }
    
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: className, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
