//
//  FoodLogCoordinator.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 18/04/2023.
//

import SwiftUI

class FoodLogCoordinator: ObservableObject, Identifiable {
	
	@Published var viewModel: FoodLogViewModel
    @Published var addMealCoordinator: AddMealCoordinator

    @Published var shouldShowAddMeal: Bool = false

	init(title: String) {
		self.viewModel = .init(title: title)
        self.addMealCoordinator = .init(title: "Add Meal")
		self.viewModel.coordinator = self
	}
}
