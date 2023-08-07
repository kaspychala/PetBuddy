//
//  AddPetViewModel.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 07/08/2023.
//

import SwiftUI

class AddPetViewModel: ObservableObject {

    @Published var title: String
    weak var coordinator: AddPetCoordinator?

    init(title: String) {
        self.title = title
    }

    func addPet() {
        // TODO
    }
}
