//
//  SettingsCoordinatorView.swift
//  Skapple
//
//  Created by Kasper Spychala on 24/10/2022.
//

import SwiftUI

struct ProfileCoordinatorView: View {
    
    // MARK: Stored Properties
    @ObservedObject var coordinator: ProfileCoordinator

    // MARK: Views
    var body: some View {
        NavigationStack {
            ProfileView(viewModel: coordinator.viewModel)
                .navigationDestination(
                    isPresented: $coordinator.shouldShowAddPet) {
                    AddPetCoordinatorView(
                        coordinator: coordinator.addPetCoordinator)
                }
        }
    }
}
