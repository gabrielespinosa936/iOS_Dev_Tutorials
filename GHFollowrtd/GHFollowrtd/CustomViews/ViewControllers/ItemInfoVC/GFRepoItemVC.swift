//
//  GFRepoItemVC.swift
//  GHFollowrtd
//
//  Created by Gabriel Espinosa on 2/12/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import UIKit
// This is a Subclass of GFItemInfoVC - Inheritance
class GFRepoItemVC : GFItemInfoVC
{
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems()
    {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
}
