//
//  NetworkManager.swift
//  Eating Psychology
//
//  Created by Makarov_Maxim on 12.10.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
     private let baseURL = "https://github.com/Maximercurius/Eating-Psychology/blob/main/db.json"
   //  let cache = NSCache<NSString, UIImage>()
     
     private init() {}
     
     func getFoodAdviceSection(for section: String, completed: @escaping (Result<[Section], EPError>) -> Void) {
         
         guard let url = URL(string: baseURL) else {
             completed(.failure(.unableToCoplete))
             return
         }
         let task = URLSession.shared.dataTask(with: url) { data, response, error in
             if let _ = error {
                 completed(.failure(.unableToCoplete))
                 return
             }
             guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                     completed(.failure(.invalidResponse))
                 return
             }
             guard let data = data else {
                 completed(.failure(.invalidData))
                 return
             }
             do {
                 let decoder = JSONDecoder()
                 decoder.keyDecodingStrategy = .convertFromSnakeCase
                 let sections = try decoder.decode([Section].self, from: data)
                 completed(.success(sections))
             }
             catch {
                 completed(.failure(.invalidData))
             }
         }
         task.resume()
     }
    func getFoodAdviceItem(for item: String, completed: @escaping (Result<[Item], EPError>) -> Void) {
                
        guard let url = URL(string: baseURL) else {
            completed(.failure(.unableToCoplete))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToCoplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let items = try decoder.decode([Item].self, from: data)
                completed(.success(items))
            }
            catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
 }
