//
//  ContentViewModel.swift
//  PingaApp
//
//  Created by Paulo César on 18/07/22.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    @Published var drinkData: DrinkData?
    let apiHandler = APIFetcher()
    
    func initView() {
        apiHandler.fetchRandomDrink { fetchedData in
            DispatchQueue.main.async {
                guard let fetchedData = fetchedData else { return }
                self.drinkData = fetchedData
            }
        }
    }
    
    func getImageURL() -> URL? {
        guard let strDrinkThumb = drinkData?.drinks.first?.strDrinkThumb else { return nil }
        return URL(string: strDrinkThumb)
    }
}
