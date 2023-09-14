//
//  FoodLogView.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 18/04/2023.
//

import SwiftUI
import RealmSwift

struct FoodLogView: View {

    @ObservedObject var viewModel: FoodLogViewModel
    @ObservedResults(PetModel.self) var pets
    @StateObject var weekManager = WeekManager()

    var body: some View {
        VStack {
            PBNavigationBar(title: viewModel.title, subtitle: nil)
            CalendarView()
                .environmentObject(weekManager)
            if pets.isEmpty {
                Text("No pets added :(")
                Spacer()
            } else {
                List {
                    ForEach(pets, id: \.self.id) { pet in
                        let foodCardModel = viewModel.getFoodCardModel(for: pet, and: weekManager.tappedDate)
                        FoodCardView(foodCardModel: foodCardModel)
                    }
                }
            }
        }
    }
}

struct FoodLogView_Previews: PreviewProvider {
    static var previews: some View {
        FoodLogView(viewModel: .init(title: "FoodLog"))
    }
}
