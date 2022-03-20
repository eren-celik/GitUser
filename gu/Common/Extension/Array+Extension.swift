//
//  Array+Extension.swift
//  gu
//
//  Created by Eren  Çelik on 17.03.2022.
//

import Foundation

//O(n): Big O notation
extension Sequence where Element: Hashable {
    
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
