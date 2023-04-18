//
//  HomeCoordinator.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 18/04/2023.
//

import SwiftUI

class HomeCoordinator: ObservableObject, Identifiable {

    @Published var viewModel: HomeViewModel

    init(title: String) {
        self.viewModel = .init(title: title)
        self.viewModel.coordinator = self
    }
}
