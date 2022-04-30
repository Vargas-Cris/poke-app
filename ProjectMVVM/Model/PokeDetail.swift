//
//  PokeDetail.swift
//  ProjectMVVM
//
//  Created by MAC21 on 30/04/22.
//

import Foundation
struct PokeDetail: Codable {
    
    let name: String
    let weight: Int
    let sprites: Sprites
}

struct Sprites: Codable {
    let other: Other
}

struct Other: Codable {
    let officialArtwork: Official
    
    // vamos a crear un alias para el nombre
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct Official: Codable {
    let front_default: String
}


