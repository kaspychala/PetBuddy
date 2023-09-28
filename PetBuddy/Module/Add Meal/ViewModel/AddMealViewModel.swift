//
//  AddMealViewModel.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 21/09/2023.
//

import Foundation

class AddMealViewModel: ObservableObject {

    @Published var title: String
    weak var coordinator: AddMealCoordinator?
    let mealRepository: MealRepository

    init(title: String) {
        self.title = title
        self.mealRepository = MealRepository()
    }

    func addMeal(meal: MealModel) {
        // WIP
    }
}
