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
    @State var offsetSize = 50
    @State var pagValue = 1
    @State var pagQtde = 0
    
    var body: some View {
        
        
        VStack {
            List {
                ForEach(networkManager.pokeIndex) { pokemon in
                    
                    HStack {
                        Text("\(pokemon.id)")
                            .bold()
                            .padding(.horizontal)
                            .aspectRatio(contentMode: .fit)
                            .onAppear{
                                pagQtde =  Int((Double(networkManager.count) /
                                                Double(offsetSize)).rounded(.up))
                            }
                        
                        Text(pokemon.pokemonData.name)
                            .italic()
                            .foregroundColor(.blue)
                            .aspectRatio(contentMode: .fill)
                    }
                }
            }.onAppear {
                networkManager.fetchData(offset: offsetValue, limit: offsetSize)
            }
            .navigationTitle("Pokemons")
            
            HStack {
                if pagValue > 1 {
                    Button("<") {
                        pagValue -= 1
                        offsetValue -= offsetSize
                        networkManager.fetchData(offset: offsetValue, limit: offsetSize)
                    }.padding()
                }
                
                Text("\(pagValue) / \(pagQtde)")
                    .padding()
                
                if pagValue < pagQtde {
                    Button(">") {
                        pagValue += 1
                        offsetValue += offsetSize
                        if pagValue == pagQtde {
                            networkManager.fetchData(offset: offsetValue, limit: networkManager.count - offsetValue)
                        }
                        else {
                            networkManager.fetchData(offset: offsetValue, limit: offsetSize)
                        }
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
