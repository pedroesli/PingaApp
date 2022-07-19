//
//  MainScreen.swift
//  PingaApp
//
//  Created by Paulo César on 19/07/22.
//

import SwiftUI

struct MainScreen: View {
    let drink: DrinkLite = DrinkLite(idDrink: "14133", strDrink: "Cosmopolitan Martini", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/upxxpq1439907580.jpg")
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    RandomDrinkButton()
                    
                    DrinkCategoryView(title: "Common Drinks")
                    DrinkCategoryView(title: "Cocktails")
                    DrinkCategoryView(title: "Alcoholic Drinks")
                    DrinkCategoryView(title: "Non-Alcoholic Drinks")
                }
            }
                .navigationTitle("PingaApp")
        }
        .accessibilityIdentifier("MainScreenNavigation")
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
