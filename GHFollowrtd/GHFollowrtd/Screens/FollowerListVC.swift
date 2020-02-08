//
//  FollowerListVC.swift
//  GHFollowrtd
//
//  Created by Gabriel Espinosa  on 2/5/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import UIKit

class FollowerListVC: UIViewController {
    
    // Enums are hashable by default
    enum Section
    {
        case main
    }
    
    var followers : [Follower] = []
    
    var userName : String!
    var collectionView : UICollectionView!
    var dataSource : UICollectionViewDiffableDataSource<Section, Follower>!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        configureViewController()
        configureCollectionView()
        getFollowers()
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setToolbarHidden(false, animated: true)

    }
    
    func configureViewController()
    {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func configureCollectionView()
    {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    func getFollowers()
    {
        
        NetworkManager.shared.getFollowers(for: userName, page: 1) { [weak self] (result) in
            
            guard let self = self else {return}
            
            switch result
            {
                case .success(let followers):
                    self.followers = followers
                    self.updateData()
                
                case .failure(let error):
                    self.presentGFAlertOnMainThread(title: "Not good", message: error.rawValue, buttonTitle: "Ok")

            }
            
        }
    }
    
    func configureDataSource()
    {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            cell.set(follower: follower)
            return cell
        })
    }
    
    func updateData()
    {
        var snapShot = NSDiffableDataSourceSnapshot<Section,Follower>()
        snapShot.appendSections([.main])
        snapShot.appendItems(followers)
        DispatchQueue.main.async { self.dataSource.apply(snapShot, animatingDifferences: true) }
    }

}
