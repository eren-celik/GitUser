//
//  Analytics+Manager.swift
//  gu
//
//  Created by Eren  Çelik on 1.04.2022.
//

import Foundation

protocol AnalyticsManagerProtocol {
    func log(_ event: AnalyticsEvents)
}

final class AnalyticsManager: AnalyticsManagerProtocol {
    
    let engine: AnalyticsEngine
    
    init(engine: AnalyticsEngine) {
        self.engine = engine
    }
    
    func log(_ event: AnalyticsEvents) {
        engine.sendAnalyticsData(name: event.name, metadata: event.metadata)
    }
}
