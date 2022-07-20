//
//  MainScreen.swift
//  PingaApp
//
//  Created by Paulo César on 19/07/22.
//

import SwiftUI

struct MainScreen: View {
    
    @StateObject private var viewModel = MainScreenViewModel()
    
    let drink: DrinkLite = DrinkLite(idDrink: "14133", strDrink: "Cosmopolitan Martini", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/upxxpq1439907580.jpg")
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    RandomDrinkButton()
                    
                    DrinkCategoryView(title: "Common Drinks", drinks: $viewModel.commonDrinks)
                    DrinkCategoryView(title: "Cocktails", drinks: $viewModel.cocktails)
                    DrinkCategoryView(title: "Alcoholic Drinks", drinks: $viewModel.alcoholicDrinks)
                    DrinkCategoryView(title: "Non-Alcoholic Drinks", drinks: $viewModel.nonAlcoholicDrinks)
                }
            }
                .navigationTitle("PingaApp")
        }
        .onAppear(perform: {
            viewModel.initView()
        })
        .accessibilityIdentifier("MainScreenNavigation")
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
