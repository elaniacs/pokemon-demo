//
//  DetailPokemonView.swift
//  PokemonDemo
//
//  Created by Cáren Sousa on 27/09/22.
//

import SwiftUI

struct DetailPokemonView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    @State var url: String
    
    var body: some View {
        Form {
            List {
                AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(networkManager.pokeDetail?.id ?? 0).png")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 250, height: 250)
                
                HStack {
                    Text("Name: ") .bold()
                    Text("\(networkManager.pokeDetail?.name ?? "")")
                }
                HStack {
                    Text("Base experience: ") .bold()
                    Text("\(networkManager.pokeDetail?.base_experience ?? 0)")
                }
                HStack {
                    Text("Height: ") .bold()
                    Text("\(networkManager.pokeDetail?.height ?? 0)")
                }
                HStack {
                    Text("Weight: ") .bold()
                    Text("\(networkManager.pokeDetail?.weight ?? 0)")
                }
            }
        }.frame(maxWidth: .infinity, alignment: .center)
        .onAppear{
            networkManager.fetchData(url: url)
        }
    }
}

//struct DetailPokemonView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailPokemonView("www.google.com.br")
//    }
//}
