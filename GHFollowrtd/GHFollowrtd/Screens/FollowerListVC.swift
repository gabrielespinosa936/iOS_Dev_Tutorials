//
//  FollowerListVC.swift
//  GHFollowrtd
//
//  Created by Gabriel Espinosa  on 2/5/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var userName : String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(for: userName, page: 1) { (result) in
            switch result
            {
                case .success(let followers):
                    print(followers)
                
                case .failure(let error):
                    self.presentGFAlertOnMainThread(title: "Not good", message: error.rawValue, buttonTitle: "Ok")

            }
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setToolbarHidden(false, animated: true)

    }

}
