// PokemonApp.swift
// Project: Pokemon 
//
// Created by ksd/Kaj Schermer Didriksen on 25/08/2026 at 13.06.
	

import SwiftUI

@main
struct PokemonApp: App {
    @State private var viewModel = PokemonController()
    var body: some Scene {
        WindowGroup {
            PokemonList().environment(viewModel)
        }
    }
}
