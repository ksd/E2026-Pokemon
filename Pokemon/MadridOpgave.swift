// MadridOpgave.swift
// Project: Pokemon 
//
// Created by ksd/Kaj Schermer Didriksen on 25/08/2026 at 14.26.
	

import SwiftUI

struct MadridOpgave: View {

    var pokemon: PokemonModel

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(pokemon.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
            HStack {
                Text(pokemon.name)
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
                Text("Info")
                    .padding(4)
                    .background(Color.white)
                    .cornerRadius(8)
            }

            .padding()
        }
        .card()
        .frame(width: 320, height: 240)
        .padding()
    }
}
extension View {
    func card() -> some View {
        modifier(CardModifier())
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.red)
            .cornerRadius(12)
            .shadow(color: Color(.systemGray), radius: 8)
    }
}


#Preview {
    MadridOpgave(pokemon: PokemonModel(name: "pikachu"))
}
