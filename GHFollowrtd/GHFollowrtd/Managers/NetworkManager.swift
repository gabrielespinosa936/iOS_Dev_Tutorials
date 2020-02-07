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
    
    func getFollowers(for username : String, page : Int, completed: @escaping ([Follower]?, String?) -> Void)
    {
        let endPoint = baseURL + "/users/\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endPoint) else {
            completed(nil, "This username created an invalid request please try again")
            return
        }
        //                                                      data,response,error are all optionals
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error
            {
                completed(nil, "Unable to complete your request.  Please check your internet connection")
                return
            }
            // setting a new variable equal to response.  If the response has an OK (200) status code
            // then set that value to the new variable reponse, otherwise handle the error
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response from the server.  Please try again")
                return
            }
            
            guard let data = data else
            {
                completed(nil, "The data received from the server is invalid.  Please try again.")
                return
                
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            }catch {
                completed(nil, "The data received from the server is invalid.  Please try again.")
            }
        }
        task.resume() // Starting network call
        
    }
}
