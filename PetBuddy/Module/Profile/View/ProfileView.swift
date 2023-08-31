//
//  SettingsView.swift
//  Skapple
//
//  Created by Kasper Spychala on 21/10/2022.
//

import SwiftUI
import RealmSwift

struct ProfileView: View {

    @ObservedObject var viewModel: ProfileViewModel
    @ObservedResults(PetModel.self) var pets


    var body: some View {
        VStack {
            PBNavigationBar(title: viewModel.title, subtitle: nil)
            Button("Add new pet") {
                viewModel.showAddPet()
            }
            List {
                ForEach(pets, id:\.self.id) { pet in
                    HStack {
                        if let image = viewModel.getPetImage(photoName: pet.photoName) {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipped()
                                .cornerRadius(16)
                        }
                        Text(pet.name ?? "Doge")
                            .shadow(
                                color: Color("BorderColor"),
                                radius: 16.0
                            )
                            .listRowSeparator(.hidden)
                    }
                }
                .listRowBackground(Color.clear)
            }
            Spacer()
       }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: .init(title: "Profile"))
    }
}
