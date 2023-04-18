//
//  SettingsViewModel.swift
//  Skapple
//
//  Created by Kasper Spychala on 24/10/2022.
//

import Foundation

class ProfileViewModel: ObservableObject {

    @Published var title: String
    weak var coordinator: ProfileCoordinator?

    init(title: String) {
        self.title = title
    }
}
