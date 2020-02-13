//
//  UserInfoVC.swift
//  GHFollowrtd
//
//  Created by Gabriel Espinosa  on 2/8/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import UIKit

class UserInfoVC: UIViewController {
    
    let headerView = UIView()
    let itemviewOne = UIView()
    let itemViewTwo = UIView()
    
    var username : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        layoutUI()
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            switch result
            {
            case .success(let user):
                print(user)
                DispatchQueue.main.async {
                    self.add(childVC: GFUserInfoHeadVC(user: user), to: self.headerView)
                    self.add(childVC: GFRepoItemVC(user: user), to: self.itemviewOne)
                    self.add(childVC: GFFollowerItemVC(user: user), to: self.itemViewTwo)
                }
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
        layoutUI()
    }
    
    func layoutUI()
    {
        let padding : CGFloat = 20
        let itemHeight : CGFloat = 140
        view.addSubview(headerView)
        view.addSubview(itemviewOne)
        view.addSubview(itemViewTwo)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        itemviewOne.translatesAutoresizingMaskIntoConstraints = false
        itemViewTwo.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            itemviewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemviewOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            itemviewOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            itemviewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemviewOne.bottomAnchor, constant: padding),
            itemViewTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            itemViewTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight)
        ])
    }
    
    func add(childVC : UIViewController, to containerView : UIView)
    {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    @objc func dismissVC()
    {
        dismiss(animated: true)
    }

}
