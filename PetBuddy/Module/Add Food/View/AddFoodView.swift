//
//  AddPetView.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 21/09/2023.
//

import SwiftUI

struct AddFoodView: View {
    @ObservedObject var viewModel: AddFoodViewModel

    @State private var name: String = ""
    @State private var kcal: String = ""

    var body: some View {
        VStack(spacing: 16) {
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
            TextField("Kcal", text: $kcal)
                .textFieldStyle(.roundedBorder)
            Button("Add") {
                let food = FoodModel()
                food.name = name
                food.kcal = Double(kcal) ?? 0.0
                viewModel.addFood(food: food)
            }
            Spacer()
        }
        .padding(16)
    }
}

#Preview {
    AddFoodView(viewModel: AddFoodViewModel(title: "Add Food"))
}
