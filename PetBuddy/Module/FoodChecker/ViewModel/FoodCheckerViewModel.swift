//
//  FoodCheckerViewModel.swift
//  PetBuddy-iOS
//
//  Created by Adam Golczak on 25/04/2023.
//

import Foundation

class FoodCheckerViewModel: ObservableObject {

    @Published var title: String
    weak var coordinator: FoodCheckerCoordinator?

    init(title: String) {
        self.title = title
    }
}
