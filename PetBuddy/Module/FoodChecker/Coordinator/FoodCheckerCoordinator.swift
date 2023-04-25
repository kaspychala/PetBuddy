//
//  FoodCheckerCoordinator.swift
//  PetBuddy-iOS
//
//  Created by Adam Golczak on 25/04/2023.
//

import Foundation

class FoodCheckerCoordinator: ObservableObject, Identifiable {

    @Published var viewModel: FoodCheckerViewModel

    init(title: String) {
        self.viewModel = .init(title: title)
        self.viewModel.coordinator = self
    }
}
