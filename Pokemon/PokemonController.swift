// PokemonController.swift
// Project: Pokemon
//
// Created by ksd/Kaj Schermer Didriksen on 27/08/2026 at 10.41.
	

import Foundation

@Observable
class PokemonController {
    var sorted = false
    var pokemonList: [PokemonModel]

    var pokemons: [PokemonModel] {
        if sorted {
            return pokemonList.sorted{$0.name < $1.name}
        } else {
            return pokemonList
        }
    }


    init() {
        pokemonList = [PokemonModel(name:"rattata"),
                    PokemonModel(name:"bulbasaur"),
                    PokemonModel(name:"charmander"),
                    PokemonModel(name:"growlithe"),
                    PokemonModel(name:"squirtle"),
                    PokemonModel(name:"jigglypuff"),
                    PokemonModel(name:"meowth"),
                    PokemonModel(name:"pikachu")]
    }
}
