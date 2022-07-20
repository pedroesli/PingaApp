//
//  MainScreenViewModel.swift
//  PingaApp
//
//  Created by Pedro Ésli Vieira do Nascimento on 20/07/22.
//

import SwiftUI

class MainScreenViewModel: ObservableObject {
    @Published var commonDrinks: [DrinkLite] = []
    @Published var cocktails: [DrinkLite] = []
    @Published var alcoholicDrinks: [DrinkLite] = []
    @Published var nonAlcoholicDrinks: [DrinkLite] = []
    
    private let apiFetcher = APIFetcher()
    
    func initView() {
        apiFetcher.fetchDrink(filter: .ordinaryDrink) { fetchedData in
            DispatchQueue.main.async {
                guard let drinks = fetchedData?.drinks else { return }
                self.commonDrinks = drinks
            }
        }
        apiFetcher.fetchDrink(filter: .cocktail) { fetchedData in
            DispatchQueue.main.async {
                guard let drinks = fetchedData?.drinks else { return }
                self.cocktails = drinks
            }
        }
        apiFetcher.fetchDrink(filter: .alcoholic) { fetchedData in
            DispatchQueue.main.async {
                guard let drinks = fetchedData?.drinks else { return }
                self.alcoholicDrinks = drinks
            }
        }
        apiFetcher.fetchDrink(filter: .nonAlcoholic) { fetchedData in
            DispatchQueue.main.async {
                guard let drinks = fetchedData?.drinks else { return }
                self.nonAlcoholicDrinks = drinks
            }
        }
    }
}
