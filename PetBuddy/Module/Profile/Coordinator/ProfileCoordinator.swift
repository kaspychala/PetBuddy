//
//  SettingsCoordinator.swift
//  Skapple
//
//  Created by Kasper Spychala on 24/10/2022.
//

import SwiftUI

class ProfileCoordinator: ObservableObject, Identifiable {
    @Published var viewModel: ProfileViewModel

    init(title: String) {
        self.viewModel = .init(title: title)
        self.viewModel.coordinator = self
    }
}
