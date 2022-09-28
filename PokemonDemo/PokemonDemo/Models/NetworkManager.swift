//
//  NetworkManager.swift
//  PokemonDemo
//
//  Created by Cáren Sousa on 26/09/22.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var count = 0
    @Published var pokeIndex = [PokemonIndex]()
    @Published var pokeDetail: PokemonDetail?
//    @Published var pokeData = [PokemonData]()
//
//    func fetchData() {
//        if let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=10&offset=10") {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { (data, response, error) in
//                if error == nil {
//                    let decoder = JSONDecoder()
//                    if let safeData = data {
//                        do {
//                            let results = try decoder.decode(PokemonModel.self, from: safeData)
//
//                            DispatchQueue.main.async {
//                                self.pokeData = results.results
//                            }
//                        }
//                        catch {
//                            print(error)
//                        }
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
    
    func fetchData(offset: Int, limit: Int) {
        
        var id = offset
        
        if let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=\(limit)&offset=\(offset)") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(PokemonModel.self, from: safeData)

                            
                            DispatchQueue.main.async {
                                self.count = results.count
                                self.pokeIndex = results.results.map{
                                    id += 1
                                    return PokemonIndex(id: id, pokemonData: $0)
                                }
                            }
                        }
                        catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func fetchData(url: String) {
        
        if let url = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(PokemonDetail.self, from: safeData)

                            DispatchQueue.main.async {
                                self.pokeDetail = results
                            }
                        }
                        catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}


