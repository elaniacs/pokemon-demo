//
//  PokemonData.swift
//  PokemonDemo
//
//  Created by Cáren Sousa on 26/09/22.
//

import Foundation

struct PokemonModel: Decodable {

   let count : Int
   let next : String?
   let previous : String?
   let results : [PokemonData]
}

struct PokemonData: Codable {

    let name : String
    let url : String
}


struct PokemonIndex: Identifiable {
    let id: Int
  
    let pokemonData: PokemonData
}


