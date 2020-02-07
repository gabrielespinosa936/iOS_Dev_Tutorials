//
//  NetworkManager.swift
//  GHFollowrtd
//
//  Created by Gabriel Espinosa  on 2/6/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import Foundation

class NetworkManager
{
    let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"
    private init()
    {
        
    }
    
    func getFollowers(for username : String, page : Int, completed: @escaping ([Follower]?), String? ) -> Void
    {
        
    }
}
