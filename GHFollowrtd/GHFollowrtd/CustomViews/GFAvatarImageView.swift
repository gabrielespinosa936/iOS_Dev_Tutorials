//
//  GFAvatarImageView.swift
//  GHFollowrtd
//
//  Created by Gabriel Espinosa  on 2/7/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let placeholderImage = UIImage(named: "avatar-placeholder")

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure()
    {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(from urlString : String )
    {
        guard let url = URL(string: urlString) else {
            return
        }
    }
}
