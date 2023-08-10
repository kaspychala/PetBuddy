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
    let petRepository: PetRepository

    init(title: String) {
        self.title = title
        self.petRepository = PetRepository()
    }

    func showAddPet() {
        coordinator?.showAddPet()
    }

    func getPets() -> [PetModel]? {
        return petRepository.getAll()
    }
}
