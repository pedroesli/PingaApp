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
        ZStack{
            VStack(spacing: 0) {
                AsyncImage(url: viewModel.drink?.imageUrl()) { image in
                    image.resizable()
                } placeholder: {
                    Image("CocktailPlaceholder").resizable()
                }
                .aspectRatio(1/1, contentMode: .fit)
                RoundedRectangle(cornerRadius: 55)
                    .foregroundColor(Color(uiColor: UIColor.tertiarySystemBackground))
                    .padding(.top, -60)
            }
            .edgesIgnoringSafeArea([.horizontal, .top])

        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                ReturnButton()
            }
        }
        .onAppear {
            viewModel.initView(idDrink)
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
