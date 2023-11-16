//
//  AddMealView.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 21/09/2023.
//

import SwiftUI
import RealmSwift

struct AddMealView: View {
    @ObservedObject var viewModel: AddMealViewModel

    @State private var weight: String = ""
    @State private var date: String = ""
    @State private var selectedPet = PetModel()
    @State private var selectedFood = FoodModel()
    @ObservedResults(PetModel.self) var pets
    @ObservedResults(FoodModel.self) var foods

    var body: some View {
        VStack(spacing: 16) {
            Picker("Choose a pet", selection: $selectedPet) {
                ForEach(pets, id: \.self) {
                    Text($0.name)
                }
            }
            Picker("Choose a food", selection: $selectedFood) {
                ForEach(foods, id: \.self) {
                    Text($0.name)
                }
            }
            TextField("Name", text: $weight)
                .textFieldStyle(.roundedBorder)
            TextField("Date", text: $date)
                .textFieldStyle(.roundedBorder)
            Button("Add") {
                let meal = MealModel()
                meal.petId = selectedPet.id
                meal.foodId = selectedFood.id
                meal.weight = Double(weight) ?? 0.0
                meal.date = Date()
                viewModel.addMeal(meal: meal)
            }
            Spacer()
        }
        .padding(16)
    }
}

#Preview {
    AddMealView(viewModel: AddMealViewModel(title: "Add Meal"))
}
