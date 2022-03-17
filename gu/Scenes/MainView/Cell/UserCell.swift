//
//  UserCell.swift
//  gu
//
//  Created by Eren  Çelik on 4.03.2022.
//

import UIKit

final class UserCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    var data: GitUser? {
        didSet {
            nameLabel.text = data?.login
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
}
