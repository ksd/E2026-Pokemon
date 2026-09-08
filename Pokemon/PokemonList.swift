// PokemonList.swift
// Project: Pokemon 
//
// Created by ksd/Kaj Schermer Didriksen on 25/08/2026 at 13.06.
	

import SwiftUI

struct PokemonList: View {
    @Environment(PokemonController.self) var viewModel
    @State private var navigationPath: [PokemonModel] = []

    var body: some View {
       @Bindable var viewModel = self.viewModel
        NavigationStack(path: $navigationPath) {
            List {
                ForEach($viewModel.pokemonList){ $pokemon in
                    NavigationLink(value: pokemon) {
                        ListView(pokemon: pokemon)
                            .listRowSeparator(.hidden)
                            .swipeActions(edge: .leading) {
                                Button(role: .confirm) {
                                    print("Rediger \(pokemon.name)")
                                    navigationPath.append(pokemon)
                                    navigationPath
                                        .append(
                                            viewModel.pokemons.randomElement()!
                                        )
                                    navigationPath
                                        .append(
                                            viewModel.pokemons.randomElement()!
                                        )
                                } label: {
                                    Label("Rediger", systemImage: "pencil")
                                }

                                Button {
                                    pokemon.isFavorite.toggle()
                                } label: {
                                    Label("Favorite", systemImage: "star.fill")
                                        .foregroundStyle(.foreground)
                                }
                            }
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button(role: .destructive) {
                                    print("Delete \(pokemon.name)")
                                } label: {
                                    Label("Slet", systemImage: "trash.fill")
                                }
                            }
                    }
                }
            }
            .navigationTitle("Pokemons")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // navigation til Add pokemon view
                    } label: {
                        Image(systemName: "plus.circle").foregroundStyle(.brown)

                    }
                }
            }
            .navigationDestination(for: PokemonModel.self) { pokemon in
                PokemonDetailView(pokemon: pokemon, navigationPath: $navigationPath)
            }
        }
    }
}

struct ListView: View {
    var pokemon:PokemonModel
    var body: some View {
        HStack {
            Image(pokemon.imageName).resizable().frame(width: 50, height: 50)
            Text(pokemon.name)
            Image(systemName: pokemon.isFavorite ? "star.fill" : "star")
                .foregroundColor(pokemon.isFavorite ? .yellow : .gray)
        }
    }
}

#Preview {
    PokemonList().environment(PokemonController())
}
