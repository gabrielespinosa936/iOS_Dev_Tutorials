//
//  User.swift
//  GHFollowrtd
//
//  Created by Gabriel Espinosa  on 2/6/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import Foundation

struct User : Codable {
    let login : String
    let avatarUrl : String
    var name : String?
    var location : String?
    var bio : String?
    let publicRepos : Int
    let publicGists : Int
    let htmlUrl : String
    let followers : Int
    let following : Int
    let createdAt : String
}

//struct User: Codable {
//    let login: String
//    let avatarUrl: String
//    var name: String?
//    var location: String?
//    var bio: String?
//    let publicRepos: Int
//    let publicGists: Int
//    let htmlUrl: String
//    let following: Int
//    let followers: Int
//    let createdAt: String
//}
