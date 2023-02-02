//
//  UITableView+Utility.swift
//  gu
//
//  Created by Eren  Çelik on 21.03.2022.
//

import UIKit

protocol CellIdentifiable {
    static var cellIdentifier: String { get }
}

extension CellIdentifiable where Self: UITableViewCell {
    
    static var cellIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: CellIdentifiable {}

extension UITableView {
    
    func reusableCell<T: UITableViewCell>() -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.cellIdentifier) as? T else {
            fatalError("DEBUG: error cell identifer \(T.cellIdentifier)")
        }
        return cell
    }
}
