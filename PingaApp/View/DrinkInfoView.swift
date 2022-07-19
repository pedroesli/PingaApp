//
//  DrinkInfoView.swift
//  PingaApp
//
//  Created by Pedro Ésli Vieira do Nascimento on 18/07/22.
//

import SwiftUI

struct DrinkInfoView: View {
    
    var idDrink: String?
    
    @StateObject private var viewModel = DrinkInfoViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    ReturnButton()
                }
            }
    }
    
    struct ReturnButton: View {
        
        @Environment(\.dismiss) var dismiss
        
        var body: some View {
            Button {
                dismiss()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 100)
                        .foregroundColor(Color(uiColor: UIColor.tertiarySystemBackground))
                        .padding(-8)
                    Text("\(Image(systemName: "chevron.left")) Return")
                        .foregroundColor(Color("AccentColor"))
                }
            }
        }
    }
}

struct DrinkInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkInfoView()
    }
}
