//
//  ContentView.swift
//  PokemonDemo
//
//  Created by Cáren Sousa on 26/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    @State var offsetValue: Int = 0
    
    var body: some View {
        
        
        VStack {
            List {
                ForEach(networkManager.pokeIndex) { pokemon in
                    
                    HStack {
                        Text("\(pokemon.id)")
                            .bold()
                            .padding(.horizontal)
                            .aspectRatio(contentMode: .fit)
                        
                        Text(pokemon.pokemonData.name)
                            .italic()
                            .foregroundColor(.blue)
                            .aspectRatio(contentMode: .fill)
                    }
                }
            }.onAppear {
                networkManager.fetchData(offset: offsetValue)
            }
            .navigationTitle("Pokemons")
            
            HStack {
                if offsetValue > 9 {
                    Button("<") {
                        offsetValue -= 50
                        networkManager.fetchData(offset: offsetValue)
                    }.padding()
                }
                
                Button("1") {
                    offsetValue = 0
                    networkManager.fetchData(offset: offsetValue)
                }.padding()
                
                if offsetValue <= networkManager.count - 50 {
                    Button(">") {
                        offsetValue += 50
                        networkManager.fetchData(offset: offsetValue)
                    }.padding()
                }
            }
        }
    }
}


//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
