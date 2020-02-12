//
//  GFItemInfoView.swift
//  GHFollowrtd
//
//  Created by Gabriel Espinosa on 2/11/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import UIKit

enum ItemInfoType {
    case repos,gists,followers,following
}

class GFItemInfoView: UIView {
    let symbolImageView = UIImageView()
    let titleLable = GFTitleLable(textAlighnment: .center, fontSize: 14)
    let countLabel = GFTitleLable(textAlighnment: .center, fontSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure()
    {
        addSubview(symbolImageView)
        addSubview(titleLable)
        addSubview(countLabel)
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolImageView.contentMode = .scaleAspectFit
        symbolImageView.tintColor = .label
        
        NSLayoutConstraint.activate([
            symbolImageView.topAnchor.constraint(equalTo: self.topAnchor),
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImageView.widthAnchor.constraint(equalToConstant: 20),
            symbolImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLable.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
            titleLable.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 12),
            titleLable.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLable.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func set(itemInfoType : ItemInfoType)
    {
        switch itemInfoType {
        case .repos:
            symbolImageView.image = UIImage(systemName: SFSymbols.repos)
            titleLable.text = "Public Repos"
            break
        case .gists:
            symbolImageView.image = UIImage(systemName: SFSymbols.gists)
            titleLable.text = "Public Gists"
            break
        case .followers:
            symbolImageView.image = UIImage(systemName: SFSymbols.followers)
            titleLable.text = "Public Followers"
            break
        case .following:
            symbolImageView.image = UIImage(systemName: SFSymbols.following)
            titleLable.text = "Public Following"
            break
        }
    }
}
