// AddPokemonView.swift
// Project: Pokemon 
//
// Created by ksd/Kaj Schermer Didriksen on 08/09/2026 at 11.13.
	

import SwiftUI

struct AddPokemonView: View {
    @Environment(PokemonController.self) var controller
    @Environment(\.dismiss) var dismiss
    @State  var name = ""
    @State  var favorite = false
    @FocusState var focusedField: Int?

    var body: some View {
        Form {
            TextField("name", text: $name)
                .focused($focusedField, equals: 1)
            Toggle("favorite", isOn: $favorite)
            Button(role: .confirm) {
                controller.add(name: name, favorite: favorite)
                dismiss()
            } label: {
                HStack {
                    Image(systemName: "person.badge.plus")
                        .resizable()
                        .frame(width: 40, height: 40)
                    Text("Tilføj Pokemon").font(.headline)
                }
                .foregroundStyle(Color(.brown))
            }
        }.onAppear {
            focusedField = 1
        }
    }
}

#Preview {
    AddPokemonView()
        .environment(PokemonController())
}

