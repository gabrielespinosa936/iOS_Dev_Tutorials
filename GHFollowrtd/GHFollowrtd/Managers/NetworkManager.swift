//
//  NetworkManager.swift
//  GHFollowrtd
//
//  Created by Gabriel Espinosa  on 2/6/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import UIKit

class NetworkManager
{
    static let shared = NetworkManager()
    private let baseURL = "https://api.github.com/users/"
    let cache = NSCache<NSString, UIImage>()
    private init()
    {
        
    }
    
    func getFollowers(for username : String, page : Int, completed: @escaping (Result<[Follower],GFError>) -> Void)
    {
        let endPoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endPoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        //                                                      data,response,error are all optionals
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error
            {
                completed(.failure(.badInternetConnection))
                return
            }
            // setting a new variable equal to response.  If the response has an OK (200) status code
            // then set that value to the new variable reponse, otherwise handle the error
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.noResponseFromServer))
                return
            }
            
            guard let data = data else
            {
                completed(.failure(.invalidDataFromServer))
                return
                
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                //completed(followers, nil)
                completed(.success(followers))
            }catch {
                completed(.failure(.invalidDataFromServer))
            }
        }
        task.resume() // Starting network call
        
    }
    
    func getUserInfo(for username : String, completed: @escaping (Result<User,GFError>) -> Void)
    {
        let endPoint = baseURL + "\(username)"
        
        guard let url = URL(string: endPoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        //                                                      data,response,error are all optionals
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error
            {
                completed(.failure(.badInternetConnection))
                return
            }
            // setting a new variable equal to response.  If the response has an OK (200) status code
            // then set that value to the new variable reponse, otherwise handle the error
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.noResponseFromServer))
                return
            }
            
            guard let data = data else
            {
                completed(.failure(.invalidDataFromServer))
                return
                
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let user = try decoder.decode(User.self, from: data)
                //completed(followers, nil)
                completed(.success(user))
            }catch {
                completed(.failure(.invalidDataFromServer))
            }
        }
        task.resume() // Starting network call
        
    }
}
