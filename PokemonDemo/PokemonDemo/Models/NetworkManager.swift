//
//  NetworkManager.swift
//  PokemonDemo
//
//  Created by Cáren Sousa on 26/09/22.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var pokeData = [PokemonData]()
    
    func fetchData() {
        if let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151&offset=0") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(PokemonModel.self, from: safeData)
                            
                            DispatchQueue.main.async {
                                self.pokeData = results.results
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
