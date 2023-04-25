//
//  HomeCoordinator.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 18/04/2023.
//

import SwiftUI

class HomeCoordinator: ObservableObject, Identifiable {
    @Published var viewModel: HomeViewModel
    @Published var foodCheckerCoordinator: FoodCheckerCoordinator

    @Published var shouldShowFoodChecker: Bool = false

    init(title: String) {
        self.viewModel = .init(title: title)
        self.foodCheckerCoordinator = .init(title: "Food Checker")
        self.viewModel.coordinator = self

    }
    
    func showFoodChecker() {
        shouldShowFoodChecker = true
    }
}
