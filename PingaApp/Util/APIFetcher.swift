//
//  APIFetcher.swift
//  PingaApp
//
//  Created by Paulo César on 18/07/22.
//

import Foundation
import SwiftUI

//protocol APIFetcher: AnyObject {
//    var fetchedData: DrinkData? { get set }
//    func fetchRandomDrink(completion: @escaping (() -> ()))
//}

class APIFetcher {
    
    func fetchRandomDrink(completion: @escaping (_ fetchedData: DrinkData?) -> Void) {
        if let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/random.php") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            //request.addValue(clientID, forHTTPHeaderField: "X-MAL-CLIENT-ID")
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Um erro ocorreu: \(error)")
                    completion(nil)
                    return
                }
                
                if let response = response as? HTTPURLResponse {
                    print("Response HTTP Status code: \(response.statusCode)")
                }
                
                let decoder = JSONDecoder()
                
                do {
                    let fetchedData = try decoder.decode(DrinkData.self, from: data!)
                    completion(fetchedData)
                } catch {
                    completion(nil)
                    print(error)
                }
            }
            task.resume()
        }
    }
    
}
