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

    var body: some View {
        VStack {
            PBNavigationBar(title: viewModel.title, subtitle: nil)
            CalendarView()
            if pets.isEmpty {
                Text("No pets added :(")
                Spacer()
            } else {
                List {
                    ForEach(pets, id:\.self.id) { pet in
                        // TODO: We should get foodCardModel for given (tapped) day. Maybe move WeekManager to FoodLogView and just pass it further? Or create environemnt variable?
                        let foodCardModel = viewModel.getFoodCardModel(for: pet)
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
