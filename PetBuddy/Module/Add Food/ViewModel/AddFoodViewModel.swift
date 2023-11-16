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
    let foodRepository: FoodRepository

    init(title: String) {
        self.title = title
        self.foodRepository = FoodRepository()
    }

    func addFood(food: FoodModel) {
        foodRepository.add(object: food)
    }
}
