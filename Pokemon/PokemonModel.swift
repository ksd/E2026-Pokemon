// PokemonModel.swift
// Project: Pokemon 
//
// Created by ksd/Kaj Schermer Didriksen on 27/08/2026 at 10.35.
	

import Foundation

struct PokemonModel: Identifiable, Hashable {
    var id = UUID()
    let name: String
    var imageName: String {
        return name
    }
    var isFavorite: Bool = false
}
