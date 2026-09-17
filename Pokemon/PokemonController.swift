// PokemonController.swift
// Project: Pokemon
//
// Created by ksd/Kaj Schermer Didriksen on 27/08/2026 at 10.41.
	

import Foundation

@Observable
class PokemonController {
    var sorted = false
   private var pokemonList: [PokemonModel]

    var pokemons: [PokemonModel] {
        get {
            if sorted {
                return pokemonList.sorted{$0.name < $1.name}
            } else {
                return pokemonList
            }
        }
        set {
            pokemonList = newValue
        }
    }

    func add(name: String, favorite: Bool){
        let pokemon = PokemonModel(name: name, isFavorite: favorite)
        pokemonList.append(pokemon)
    }


    init() {
        pokemonList = [
            PokemonModel(name:"pikachu"),
            PokemonModel(name:"rattata"),
            PokemonModel(name:"bulbasaur"),]
    }
}

/*
 PokemonModel(name:"rattata"),
 PokemonModel(name:"bulbasaur"),
 PokemonModel(name:"charmander"),
 PokemonModel(name:"growlithe"),
 PokemonModel(name:"squirtle"),
 PokemonModel(name:"jigglypuff"),
 PokemonModel(name:"meowth"),
 */
