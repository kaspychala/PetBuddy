//
//  FoodLogViewModel.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 18/04/2023.
//

import SwiftUI

class FoodLogViewModel: ObservableObject {

    @Published var title: String
    weak var coordinator: FoodLogCoordinator?
    let mealRepository: MealRepository
    let foodRepository: FoodRepository

    init(title: String) {
        self.title = title
        self.mealRepository = MealRepository()
        self.foodRepository = FoodRepository()
    }

    func getFoodCardModel(for pet: PetModel, and date: Date) -> FoodCardModel {
        // TODO: Move to FoodKcalResolver for better readability and cleaner code.
        guard let meals = mealRepository.getAll()?.filter({ meal in
            return meal.petId == pet.id && meal.date == date
        }) else {
            return FoodCardModel(
                petName: pet.name,
                kcalNeeded: pet.dailyKcal,
                kcalEaten: 0.0,
                kcalLeft: pet.dailyKcal,
                totalMealsEaten: 0)
        }
        var kcalEaten = 0.0
        meals.forEach { meal in
            guard let food = foodRepository.get(id: meal.foodId) else {
                return
            }
            // TODO: Just for PoC, we should check how to calculate kcals properly.
            kcalEaten += meal.weight * food.kcal
        }
        var kcalLeft = pet.dailyKcal - kcalEaten
        let foodCardModel = FoodCardModel(
            petName: pet.name,
            kcalNeeded: pet.dailyKcal,
            kcalEaten: kcalEaten,
            kcalLeft: kcalLeft,
            totalMealsEaten: meals.count)
        return foodCardModel
    }
}
