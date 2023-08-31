//
//  SettingsViewModel.swift
//  Skapple
//
//  Created by Kasper Spychala on 24/10/2022.
//

import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {

    @Published var title: String
    weak var coordinator: ProfileCoordinator?
    let petRepository: PetRepository
    let fileService: FileManagerService = .shared

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

    func getPetImage(photoName: String) -> UIImage? {
        do {
            return try fileService.loadImage(fileName: photoName)
        } catch FileManagerError.fileReadError {
            print("Error while reading file.")
            return nil
        } catch {
            print("Error while loading image.")
            return nil
        }
    }
}
