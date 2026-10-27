// PokemonController.swift
// Project: Pokemon
//
// Created by ksd/Kaj Schermer Didriksen on 27/08/2026 at 10.41.
	

import Foundation

@Observable
class PokemonController {
    var sorted = false
    private let fileName = "pokemons.json"
    
    // The single source of truth – every change (including append) is saved to disk
    private var pokemonList: [PokemonModel] = [] {
        didSet {
            write(pokemonList, toJson: fileName)
        }
    }

    init(){
        pokemonList = read([PokemonModel].self, fromJson: fileName) ?? []
    }

    // Read-only view for the UI – changes must go through the methods below,
    // so a sorted copy is never written back over the original order
    var pokemons: [PokemonModel] {
        if sorted {
            return pokemonList.sorted{$0.name < $1.name}
        } else {
            return pokemonList
        }
    }

    func add(name: String, favorite: Bool){
        let pokemon = PokemonModel(name: name, isFavorite: favorite)
        pokemonList.append(pokemon)
    }

    // Finds the pokemon by id, so it works whether the list is sorted or not
    func toggleFavorite(_ pokemon: PokemonModel) {
        guard let index = pokemonList.firstIndex(where: { $0.id == pokemon.id }) else {
            return
        }
        pokemonList[index].isFavorite.toggle()
    }

    func write<T: Encodable>(_ object: T, toJson file: String) {
        let homeFolder = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        guard let path = homeFolder?.appendingPathComponent(file) else {
            return
        }

        do {
            let data = try JSONEncoder().encode(object)
            try data.write(to: path)
        }
        catch {
            print("Could not write file \(path): \(error)")
        }
    }

    func read<T: Decodable>(_ type: T.Type, fromJson file: String) -> T? {
        let homeFolder = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        guard let path = homeFolder?.appendingPathComponent(file) else {
            return nil
        }
        do {
            let data = try Data(contentsOf: path)
            return try JSONDecoder().decode(type, from: data)
        }
        catch {
            print("Could not read file \(path): \(error)")
            return nil
        }
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
