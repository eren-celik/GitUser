//
//  UserCell.swift
//  gu
//
//  Created by Eren  Çelik on 4.03.2022.
//

import UIKit
import SDWebImage

final class UserCell: UITableViewCell {
    
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var userImageView: UIImageView!
    @IBOutlet weak private var containerView: UIView!
    
    var data: GitUser? {
        didSet {
            setData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        data = nil
        userImageView.image = nil
    }
    
    private func setData() {
        nameLabel.text = data?.login
        guard let avatarURL = data?.avatarURL,
              let url = URL(string: avatarURL) else { return }
        userImageView.sd_setImage(with: url, completed: nil)
    }
    
    private func configureCell() {
        setStyle()
        userImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
    }
    
    private func setStyle() {
        
        self.selectionStyle = .none
        
        userImageView.layer.cornerRadius = 10
        userImageView.layer.masksToBounds = true
        
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
        containerView.backgroundColor = .lightGray
        
        nameLabel.font = .rounded(ofSize: 17, weight: .semibold)
    }
}
