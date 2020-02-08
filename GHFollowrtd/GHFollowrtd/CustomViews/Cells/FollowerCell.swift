//
//  FollowerCell.swift
//  GHFollowrtd
//
//  Created by Gabriel Espinosa  on 2/7/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    static let reuseID = "FolloweCell"
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let userNameLabel = GFTitleLable(textAlighnment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower : Follower)
    {
        userNameLabel.text = follower.login
    }
    
    private func configure()
    {
        let padding : CGFloat = 8
        
        addSubview(avatarImageView)
        addSubview(userNameLabel)
        
        NSLayoutConstraint.activate([
               avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
               avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
               avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
               avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
               
               userNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
               userNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
               userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
               userNameLabel.heightAnchor.constraint(equalToConstant: 20)
           ])
    }
}
