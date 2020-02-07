//
//  ErrorMessage.swift
//  GHFollowrtd
//
//  Created by Gabriel Espinosa  on 2/7/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import Foundation

enum GFError : String, Error
{
    case invalidUsername = "This username created an invalid request please try again."
    case badInternetConnection = "Unable to complete your request.  Please check your internet connection."
    case noResponseFromServer = "Invalid response from the server.  Please try again."
    case invalidDataFromServer = "The data received from the server is invalid.  Please try again."
    
}
