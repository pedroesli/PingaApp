//
//  APIFetcher.swift
//  PingaApp
//
//  Created by Paulo César on 18/07/22.
//

import Foundation
import SwiftUI

protocol APIFetcher: AnyObject {
    var fetchedData: DrinkData? { get set }
    func fetchRandomDrink(completion: @escaping (() -> ()))
}

extension APIFetcher {
    func fetchRandomDrink(completion: @escaping (() -> ())) {
        let group = DispatchGroup()
        group.enter()
        if let url = URL(string: "www.thecocktaildb.com/api/json/v1/1/random.php") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            //request.addValue(clientID, forHTTPHeaderField: "X-MAL-CLIENT-ID")
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Um erro ocorreu: \(error)")
                    return
                }
                
                if let response = response as? HTTPURLResponse {
                    print("Response HTTP Status code: \(response.statusCode)")
                }
                
                let decoder = JSONDecoder()
                
                do {
                    self.fetchedData = try decoder.decode(DrinkData.self, from: data!)
                } catch {
                    self.fetchedData = nil
                    print(error)
                }
                
                group.leave()
            }
            task.resume()
        }
        
        group.notify(queue: .main) {
            completion()
        }
    }
}
