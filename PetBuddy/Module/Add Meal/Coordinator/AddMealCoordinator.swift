//
//  AddMealCoordinator.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 21/09/2023.
//

import Foundation
import SwiftUI

class AddMealCoordinator: ObservableObject, Identifiable {
    @Published var viewModel: AddMealViewModel

    init(title: String) {
        self.viewModel = .init(title: title)
        self.viewModel.coordinator = self
    }
}
