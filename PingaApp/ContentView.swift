//
//  ContentView.swift
//  PingaApp
//
//  Created by Pedro Ésli Vieira do Nascimento on 15/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, world!")
                    .padding()
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
