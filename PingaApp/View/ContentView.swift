//
//  ContentView.swift
//  PingaApp
//
//  Created by Pedro Ésli Vieira do Nascimento on 15/07/22.
// /[^0-9a-zA-Z.]/g

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ContentViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, world!")
                    .padding()
                
                AsyncImage(url: vm.getImageURL()) { image in
                    image.resizable()
                } placeholder: {
                    Image("cocktailPlaceholder").resizable()
                }
                .aspectRatio(1/1, contentMode: .fit)

                NavigationLink("Segunda tela", destination: DrinkInfoView())
            }
        }
        .onAppear {
            vm.initView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
