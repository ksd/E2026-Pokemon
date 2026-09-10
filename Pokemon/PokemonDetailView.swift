// PokemonDetailView.swift
// Project: Pokemon 
//
// Created by ksd/Kaj Schermer Didriksen on 03/09/2026 at 09.51.
	

import SwiftUI

struct PokemonDetailView: View {
    var pokemon: PokemonModel
    @Binding var navigationPath: [Navigation]
    var body: some View {
        Image(pokemon.imageName)
            .onTapGesture {
                navigationPath.removeAll()
            }
    }
}

#Preview {
    let navigationPath: Binding<[Navigation]> = .constant([.pokemonDetail(PokemonModel(name: "charmander"))])
    PokemonDetailView(
        pokemon: PokemonModel(name: "pikachu"),
        navigationPath: navigationPath)
}
