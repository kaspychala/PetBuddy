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

    init(title: String) {
        self.title = title
    }
}
