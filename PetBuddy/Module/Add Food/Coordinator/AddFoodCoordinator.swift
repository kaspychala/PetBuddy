//
//  AddFoodCoordinator.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 21/09/2023.
//

import Foundation
import SwiftUI

class AddFoodCoordinator: ObservableObject, Identifiable {
    @Published var viewModel: AddFoodViewModel

    init(title: String) {
        self.viewModel = .init(title: title)
        self.viewModel.coordinator = self
    }
}
