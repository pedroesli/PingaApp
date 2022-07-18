//
//  ContentViewModel.swift
//  PingaApp
//
//  Created by Paulo César on 18/07/22.
//

import Foundation

class ContentViewModel: ObservableObject, APIFetcher {
    @Published var fetchedData: DrinkData?
    
    init() {
        fetchRandomDrink(completion: {})
    }
}
