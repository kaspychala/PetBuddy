//
//  HealthBookViewModel.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 18/04/2023.
//

import SwiftUI

class HealthBookViewModel: ObservableObject {

    @Published var title: String
    weak var coordinator: HealthBookCoordinator?

    init(title: String) {
        self.title = title
    }
}
