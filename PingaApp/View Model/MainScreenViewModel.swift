//
//  MainScreenViewModel.swift
//  PingaApp
//
//  Created by Pedro Ésli Vieira do Nascimento on 20/07/22.
// 

import Foundation

class MainScreenViewModel: ObservableObject {
    
    @Published var ordinaryDrinks: [DrinkLite] = []
    @Published var cocktails: [DrinkLite] = []
    @Published var alcoholicDrinks: [DrinkLite] = []
    @Published var nonAlcoholicDrinks: [DrinkLite] = []
    private let apiFetcher = APIFetcher()
    
    func initView() {
        fetchOrdinaryDrinks()
        fetchCocktails()
        fetchAlcoholicDrinks()
        fetchNonAlcoholicDrinks()
    }
    
    private func fetchOrdinaryDrinks() {
        apiFetcher.fetchDrink(filter: .ordinaryDrink) { fetchedData in
            DispatchQueue.main.async {
                guard let ordinaryDrinks = fetchedData?.drinks else { return }
                self.ordinaryDrinks = ordinaryDrinks
            }
        }
    }
    
    private func fetchCocktails() {
        apiFetcher.fetchDrink(filter: .cocktail) { fetchedData in
            DispatchQueue.main.async {
                guard let cocktails = fetchedData?.drinks else { return }
                self.cocktails = cocktails
            }
        }
    }
    
    private func fetchAlcoholicDrinks() {
        apiFetcher.fetchDrink(filter: .alcoholic) { fetchedData in
            DispatchQueue.main.async {
                guard let alcoholicDrinks = fetchedData?.drinks else { return }
                self.alcoholicDrinks = alcoholicDrinks
            }
        }
    }
    
    private func fetchNonAlcoholicDrinks() {
        apiFetcher.fetchDrink(filter: .nonAlcoholic) { fetchedData in
            DispatchQueue.main.async {
                guard let nonAlcoholicDrinks = fetchedData?.drinks else { return }
                self.nonAlcoholicDrinks = nonAlcoholicDrinks
            }
        }
    }
}
