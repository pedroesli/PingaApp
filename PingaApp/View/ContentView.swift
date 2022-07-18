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
                AsyncImage(url: URL(string: vm.fetchedData!.strDrinkThumb))
                NavigationLink("Segunda tela", destination: SecondContentView())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
