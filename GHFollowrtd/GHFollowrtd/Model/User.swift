//
//  User.swift
//  GHFollowrtd
//
//  Created by Gabriel Espinosa  on 2/6/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import Foundation

struct user : Codable {
    var login : String
    var avatarUrl : String
    var name : String?
    var location : String?
    var bio : String?
    var publicRepost : Int
    var publicGists : Int
    var htmlUrl : String
    var followers : Int
    var following : Int
    var createdAt : String
}
