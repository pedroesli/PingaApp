//
//  DrinkModule.swift
//  PingaApp
//
//  Created by Paulo César on 19/07/22.
//

import SwiftUI

struct DrinkModule: View {
    var drink: DrinkLite
    
    var body: some View {
        Button(action: {  }) {
            VStack {
                AsyncImage(url: URL(string: drink.strDrinkThumb), content: { image in
                    image.resizable()
                }, placeholder: { Image(systemName: "photo") })
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150, alignment: .center)
                    .overlay {
                        VStack {
                            Spacer()
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.yellow)
                                    .frame(width: 150, height: 20)
                                Text(drink.strDrink)
                                    .font(.system(size: 12.0, weight: .bold, design: .rounded))
                            }
                        }
                    }
            }
            .cornerRadius(20)
            .frame(width: 150, height: 150)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.yellow, lineWidth: 2.5)
            }
            .padding(5)
        }
        .foregroundColor(.black)
    }
}

struct DrinkModule_Previews: PreviewProvider {
    static var previews: some View {
        let drink: DrinkLite = DrinkLite(idDrink: "14133", strDrink: "Cosmopolitan Martini", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/upxxpq1439907580.jpg")
        
        DrinkModule(drink: drink)
    }
}
