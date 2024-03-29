//
//  FoodLogCoordinatorView.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 18/04/2023.
//

import SwiftUI

struct FoodLogCoordinatorView: View {
	
	// MARK: Stored Properties
	@ObservedObject var coordinator: FoodLogCoordinator
	
	// MARK: Views
	var body: some View {
        NavigationStack {
            FoodLogView(viewModel: coordinator.viewModel)
                .navigationDestination(
                    isPresented: $coordinator.shouldShowAddMeal) {
                        AddMealCoordinatorView(
                            coordinator: coordinator.addMealCoordinator)
                    }
                .navigationDestination(
                    isPresented: $coordinator.shouldShowAddFood) {
                        AddFoodCoordinatorView(
                            coordinator: coordinator.addFoodCoordinator)
                    }
                .navigationTitle("Food log")
                .navigationBarTitleDisplayMode(.large)
                .toolbar(.visible)
        }
	}
}
