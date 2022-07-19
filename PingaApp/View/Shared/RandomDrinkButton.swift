//
//  RandomDrinkButton.swift
//  PingaApp
//
//  Created by Paulo César on 19/07/22.
//

import SwiftUI

struct RandomDrinkButton: View {
    var body: some View {
        Button(action: { }) {
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
