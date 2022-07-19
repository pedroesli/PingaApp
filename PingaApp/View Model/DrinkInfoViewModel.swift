//
//  DrinkInfoViewModel.swift
//  PingaApp
//
//  Created by Pedro Ésli Vieira do Nascimento on 18/07/22.
//

import Foundation

class DrinkInfoViewModel: ObservableObject {
    
    @Published var drink: Drink?
    private let apiFetcher = APIFetcher()
    
    func initView(idDrink: String?) {
        if let idDrink = idDrink {
            getDrink(idDrink)
        }
        else {
            randomDrink()
        }
    }
    
    private func randomDrink() {
        apiFetcher.fetchRandomDrink { fetchedData in
            DispatchQueue.main.async {
                guard let drink = fetchedData?.drinks.first else { return }
                self.drink = drink
            }
        }
    }
    
    private func getDrink(_ idDrink: String) {
        
    }
}
