//
//  AddFoodViewModel.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 21/09/2023.
//

import Foundation

class AddFoodViewModel: ObservableObject {

    @Published var title: String
    weak var coordinator: AddFoodCoordinator?

    init(title: String) {
        self.title = title
    }

    func addFood(food: FoodModel) {
        // WIP
    }
}
