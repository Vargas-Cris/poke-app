//
//  PokeViewModel.swift
//  ProjectMVVM
//
//  Created by Linder Anderson Hassinger Solano    on 22/04/22.
//

import Foundation

class PokeViewModel {
    
    var pokemons = [Result]()
    
    let URL_API: String = "https://pokeapi.co/api/v2/pokemon"
    
    func getDataFromAPI() async {
        // Pasa1: Convertir el string a URL
        guard let url = URL(string: URL_API) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decoder = try? JSONDecoder().decode(Pokemon.self, from: data) {
                DispatchQueue.main.async(execute: {
                    decoder.results.forEach { pokemon in
                        // Estamos agregando cada pokemon al array pokemons
                        self.pokemons.append(pokemon)
                    }
                })
            }
        } catch {
            print("error found")
        }
        //funcion get info from url
        func getPokeDetail(url:String) async{
            guard let url - URL(string: url)else {
                 return 
            }
        }
    }
}
