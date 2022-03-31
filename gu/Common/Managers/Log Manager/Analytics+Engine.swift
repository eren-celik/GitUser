//
//  Analytics+Engine.swift
//  gu
//
//  Created by Eren  Çelik on 1.04.2022.
//

import Foundation

protocol AnalyticsEngine: AnyObject {
    func sendAnalyticsData(name: String, metadata: Dictionary<String, Any>?)
}

final class FirebaseEngine: AnalyticsEngine {
    
    func sendAnalyticsData(name: String, metadata: Dictionary<String, Any>?) {
        print("DEBUG: send data => Analytics name ", name, "Analytics metadata: ", metadata ?? "null")
    }
}
