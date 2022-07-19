//
//  DrinkCategoryView.swift
//  PingaApp
//
//  Created by Paulo César on 19/07/22.
//

import SwiftUI

struct DrinkCategoryView: View {
    let drink: DrinkLite = DrinkLite(idDrink: "14133", strDrink: "Cosmopolitan Martini", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/upxxpq1439907580.jpg")
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
                //.multilineTextAlignment(.trailing)
                .frame(width: UIScreen.main.bounds.size.width / 1.1, height: 25, alignment: .leading)
                .font(.system(size: 24.0, weight: .bold, design: .rounded))
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<6) {_ in
                        DrinkModule(drink: drink)
                    }
                }
                .padding(.horizontal, 10)
            }
            //.background(Color(UIColor.lightGray))
        }
        .padding(.top, 20)
    }
}

struct DrinkCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkCategoryView(title: "Non-Alcoholic Drinks")
    }
}
