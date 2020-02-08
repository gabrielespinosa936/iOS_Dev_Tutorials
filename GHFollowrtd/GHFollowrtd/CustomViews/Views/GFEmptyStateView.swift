//
//  GFEmptyStateView.swift
//  GHFollowrtd
//
//  Created by Gabriel Espinosa  on 2/8/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import UIKit


class GFEmptyStateView: UIView {
    let messageLable = GFTitleLable(textAlighnment: .center, fontSize: 28)
    let logoImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure()
    {
        addSubview(messageLable)
        addSubview(logoImageView)
        
        messageLable.numberOfLines = 3
        messageLable.textColor = .secondaryLabel
        
        logoImageView.image = UIImage(named: "empty-state-logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messageLable.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
            messageLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messageLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            messageLable.heightAnchor.constraint(equalToConstant: 200)
            
        ])
    }
}
