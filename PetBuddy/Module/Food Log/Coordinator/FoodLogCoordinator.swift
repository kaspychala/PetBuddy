//
//  FoodLogCoordinator.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 18/04/2023.
//

import SwiftUI

class FoodLogCoordinator: ObservableObject, Identifiable {

    @Published var viewModel: FoodLogViewModel

    init(title: String) {
        self.viewModel = .init(title: title)
        self.viewModel.coordinator = self
    }
}
