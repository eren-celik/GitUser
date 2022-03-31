//
//  Analytics+Event.swift
//  gu
//
//  Created by Eren  Çelik on 1.04.2022.
//

import Foundation

private protocol AnalyticsEventsProtocol {
    var name: String { get }
    var metadata: Dictionary<String, Any> { get }
}

struct AnalyticsEvents: AnalyticsEventsProtocol {
    
    var name: String
    var metadata: [String: Any]
    
    init(name: String, metadata: [String : Any] = [:]) {
        self.name = name
        self.metadata = metadata
    }
    
    //MARK: Events
    
    static let homePageShowed = AnalyticsEvents(name: "homePageShowed")
    static let detailPageShowed = AnalyticsEvents(name: "detailPageShowed")
    
    
    static func getFailureData(data: String) -> AnalyticsEvents {
        return AnalyticsEvents(name: "getFailureData",
                               metadata: ["data": data])
    }
}
