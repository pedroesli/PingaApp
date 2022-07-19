//
//  RandomDrinkButton.swift
//  PingaApp
//
//  Created by Paulo César on 19/07/22.
//

import SwiftUI

struct RandomDrinkButton: View {
    @State private var buttonHasBeenPressed: Bool = false
    
    var body: some View {
        NavigationLink(isActive: $buttonHasBeenPressed, destination: {
            DrinkInfoView()
        }, label: { EmptyView() })
        
        Button(action: { buttonHasBeenPressed = true }) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.yellow)
                HStack {
                    Text("Random Drink")
                        .font(.system(size: 24.0, weight: .bold, design: .rounded))
                    Image(systemName: "dice.fill")
                        .font(.system(size: 24.0, weight: .bold, design: .rounded))
                }
                .foregroundColor(.black)
                
            }
        }
        .frame(width: UIScreen.main.bounds.size.width / 1.15, height: 50)
        .padding()
    }
}

struct RandomDrinkButton_Previews: PreviewProvider {
    static var previews: some View {
        RandomDrinkButton()
    }
}
