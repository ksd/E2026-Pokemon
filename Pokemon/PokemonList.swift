// PokemonList.swift
// Project: Pokemon 
//
// Created by ksd/Kaj Schermer Didriksen on 25/08/2026 at 13.06.
	

import SwiftUI

enum Navigation: Hashable {
    case add
    case pokemonDetail(PokemonModel)
}

struct PokemonList: View {
    @Environment(PokemonController.self) var viewModel
    @State private var navigationPath: [Navigation] = []
    @State private var isPresented: Bool = false

    var body: some View {
        NavigationStack(path: $navigationPath) {
            List {
                ForEach(viewModel.pokemons){ pokemon in
                    NavigationLink(value: Navigation.pokemonDetail(pokemon)) {
                        ListView(pokemon: pokemon)
                            .listRowSeparator(.hidden)
                            .swipeActions(edge: .leading) {
                                Button(role: .confirm) {
                                    print("Rediger \(pokemon.name)")
                                    navigationPath.append(.pokemonDetail(pokemon))
                                    navigationPath
                                        .append(
                                            .pokemonDetail(viewModel.pokemons.randomElement()!)
                                        )
                                    navigationPath
                                        .append(
                                            .pokemonDetail(viewModel.pokemons.randomElement()!)
                                        )
                                } label: {
                                    Label("Rediger", systemImage: "pencil")
                                }

                                Button {
                                    viewModel.toggleFavorite(pokemon)
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
                        isPresented = true
                    } label: {
                        Image(systemName: "plus.circle").foregroundStyle(.brown)

                    }
                }
            }
            .navigationDestination(for: Navigation.self) { destination in
                switch destination {
                    case .add:
                        AddPokemonView()
                    case .pokemonDetail(let pokemon):
                        PokemonDetailView(
                            pokemon: pokemon,
                            navigationPath: $navigationPath
                        )
                }
            }
        }
        .sheet(isPresented: $isPresented) {
            AddPokemonView()
                .presentationDetents([.medium])
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
