//
//  GFRepoItemVC.swift
//  GHFollowrtd
//
//  Created by Gabriel Espinosa on 2/12/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import UIKit
// This is a Subclass of GFItemInfoVC - Inheritance
class GFFollowerItemVC : GFItemInfoVC
{
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems()
    {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
