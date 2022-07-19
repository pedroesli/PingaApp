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
            Color.black.ignoresSafeArea()
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    DrinkImagePreview()
                    ZStack {
                        RoundedRectangle(cornerRadius: 55)
                            .foregroundColor(.black)
                            .offset(x: 0, y: -60)
                        Content()
                    }
                }
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
        .environmentObject(viewModel)
    }
    
    struct ReturnButton: View {
        
        @Environment(\.dismiss) var dismiss
        
        var body: some View {
            Button {
                dismiss()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 100)
                        .foregroundColor(.black.opacity(0.75))
                        .padding(-8)
                    Text("\(Image(systemName: "chevron.left")) Return")
                        .foregroundColor(Color("AccentColor"))
                }
            }
        }
    }
    
    struct DrinkImagePreview: View {
        
        @EnvironmentObject private var viewModel: DrinkInfoViewModel
        
        var body: some View {
            AsyncImage(url: viewModel.drink?.imageUrl()) { image in
                image.resizable()
            } placeholder: {
                Image("CocktailPlaceholder").resizable()
            }
            .aspectRatio(1/1, contentMode: .fit)
        }
    }
    
    struct SubTitleText: View {
        var text: String
        
        init(_ text: String) {
            self.text = text
        }
        
        var body: some View {
            HStack {
                Text(text)
                    .font(.system(size: 24).bold())
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.top, 22)
            .padding(.bottom, 7)
        }
    }
    
    struct InfoText: View {
        var text: String
        
        init(_ text: String) {
            self.text = text
        }
        
        var body: some View {
            Text(text)
                .font(.system(size: 16))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    struct Content: View {
        
        @EnvironmentObject private var viewModel: DrinkInfoViewModel
        
        var body: some View {
            VStack(spacing: 0) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray)
                    .frame(width: 50, height: 3)
                    .padding(.top)
                if let drink = viewModel.drink {
                    Group {
                        Text(drink.strDrink)
                            .font(.system(size: 32).bold())
                            .foregroundColor(.white)
                            .padding(.top, 40)
                        Text("- \(drink.strCategory) -")
                            .font(.system(size: 20))
                            .foregroundColor(Color("SubTitleColor"))
                            .padding(.top, 9)
                        Text(drink.strAlcoholic)
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .padding(10)
                            .background {
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundColor(Color("AccentColor"))
                            }
                            .padding(.top, 28)
                    }
                    SubTitleText("Ingredients")
                    VStack {
                        ForEach(drink.measuresAndIngredients(), id: \.ingredient) { info in
                            VStack{
                                IngredientImage(ingredient: info.ingredient)
                                Text("\(info.measure)\(info.ingredient)")
                                    .font(.system(size: 16))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    SubTitleText("Instructions")
                    InfoText(drink.strInstructions)
                    SubTitleText("Glass")
                    InfoText("Serve: \(drink.strGlass)")
                }
                else {
                    ProgressView()
                        .tint(Color("AccentColor"))
                        .frame(height: UIScreen.main.bounds.height / 2)
                }
            }
            .offset(x: 0, y: -60)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 15)
        }
    }
    
    struct IngredientImage: View {
        let ingredient: String
        private let ingredientUrl = "https://www.thecocktaildb.com/images/ingredients/"
        
        var body: some View {
            let ingredientImageName = ingredient.replacingOccurrences(of: " ", with: "%20")
            AsyncImage(url: URL(string: ingredientUrl + ingredientImageName + "-Small.png")) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "photo").resizable()
            }
            .aspectRatio(1/1, contentMode: .fit)
            .frame(height: 150)
        }
    }
}

struct DrinkInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkInfoView()
    }
}
