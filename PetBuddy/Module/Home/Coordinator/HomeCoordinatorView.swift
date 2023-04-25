//
//  HomeCoordinatorView.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 18/04/2023.
//

import SwiftUI

struct HomeCoordinatorView: View {

    // MARK: Stored Properties
    @ObservedObject var coordinator: HomeCoordinator

    // MARK: Views
    var body: some View {
        NavigationStack {
            HomeView(viewModel: coordinator.viewModel)
                .navigationDestination(
                    isPresented: $coordinator.shouldShowFoodChecker) {
                    FoodCheckerCoordinatorView(
                        coordinator: coordinator.foodCheckerCoordinator)
                }
        }
    }
}
