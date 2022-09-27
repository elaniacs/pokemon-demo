//
//  ContentView.swift
//  PokemonDemo
//
//  Created by Cáren Sousa on 26/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        
        
        VStack {
            List {
                ForEach(networkManager.pokeData) { pokemon in
                    Text(pokemon.name)
                }
            }.onAppear {
                networkManager.fetchData()
            }
            .navigationTitle("Pokemons")
        }
    }
}


//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
