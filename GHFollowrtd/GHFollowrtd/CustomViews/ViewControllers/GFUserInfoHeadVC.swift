//
//  GFUserInfoHeadVC.swift
//  GHFollowrtd
//
//  Created by Gabriel Espinosa  on 2/9/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import UIKit

class GFUserInfoHeadVC: UIViewController {

    let avatarImageView     = GFAvatarImageView(frame: .zero)
    let usernameLabel       = GFTitleLable(textAlighnment: .left, fontSize: 34)
    let nameLabel           = GFSecondayTitileLabel(fontSize: 18)
    let locationImageView   = UIImageView()
    let locationLabel       = GFSecondayTitileLabel(fontSize: 18)
    let bioLabel            = GFBodyLabel(textAlighnment: .left)
    var user : User!
    
    
    init(user : User)
    {
        super.init(nibName : nil, bundle : nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        layoutUI()
        configureUIElements()
    }
    
    func configureUIElements()
    {
        avatarImageView.downloadImage(from: user.avatarUrl)
        usernameLabel.text = user.login
        nameLabel.text = user.name ?? ""
        locationLabel.text = user.location ?? "No location"
        bioLabel.text = user.bio ?? "No bio available"
        bioLabel.numberOfLines = 3
        
        locationImageView.image = UIImage.init(systemName: SFSymbols.location)
        locationImageView.tintColor = .secondaryLabel
        
    }
    
    func addSubviews()
    {
        view.addSubview(avatarImageView)
        view.addSubview(usernameLabel)
        view.addSubview(nameLabel)
        view.addSubview(locationImageView)
        view.addSubview(locationLabel)
        view.addSubview(bioLabel)
    }
    func layoutUI()
    {
        let padding : CGFloat = 20
        let textImagePadding : CGFloat = 12
        let avatarImageViewPadding : CGFloat = 90
        let heighAnchorPadding : CGFloat = 38
        let nameLabelConstant : CGFloat = 8
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: avatarImageViewPadding),
            avatarImageView.heightAnchor.constraint(equalToConstant: avatarImageViewPadding),
            
            // Aligning the username label to the top of avatar image view.
            usernameLabel.topAnchor.constraint(equalTo: view.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: heighAnchorPadding),
            
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: nameLabelConstant),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            locationImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor ),
            locationImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            locationImageView.widthAnchor.constraint(equalToConstant: padding),
            locationImageView.heightAnchor.constraint(equalToConstant: padding),
            
            locationLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor, constant: 0),
            locationLabel.leadingAnchor.constraint(equalTo: locationLabel.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: textImagePadding),
            bioLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            bioLabel.heightAnchor.constraint(equalToConstant: 60)
            
        ])
    }
}
