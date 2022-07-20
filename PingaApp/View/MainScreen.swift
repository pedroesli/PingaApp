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
                    
                    DrinkCategoryView(title: "Common Drinks", drinks: $viewModel.ordinaryDrinks)
                        .accessibilityIdentifier("Common_Drinks")
                    DrinkCategoryView(title: "Cocktails", drinks: $viewModel.cocktails)
                        .accessibilityIdentifier("Cocktails")
                    DrinkCategoryView(title: "Alcoholic Drinks", drinks: $viewModel.alcoholicDrinks)
                        .accessibilityIdentifier("Alcoholic_Drinks")
                    DrinkCategoryView(title: "Non-Alcoholic Drinks", drinks: $viewModel.nonAlcoholicDrinks)
                        .accessibilityIdentifier("Non_Alcoholic_Drinks")
                }
            }
                .navigationTitle("PingaApp")
        }
        .onAppear(perform: {
            viewModel.initView()
        })
        .accessibilityIdentifier("MainScreenNavigation")
        .onAppear {
            viewModel.initView()
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
