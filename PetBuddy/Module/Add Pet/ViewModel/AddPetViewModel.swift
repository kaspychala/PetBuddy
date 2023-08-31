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
    let petRepository: PetRepository
    let fileManagerService: FileManagerService

    init(title: String) {
        self.title = title
        self.petRepository = PetRepository()
        self.fileManagerService = .shared
    }

    func addPet(pet: PetModel, image: UIImage?) {
        guard let image = image else {
            petRepository.add(object: pet)
            return
        }
        do {
            try fileManagerService.saveImage(image, fileName: pet.photoName, maxHeight: 500)
            petRepository.add(object: pet)
        } catch FileManagerError.fileWriteError {
            print("Error while saving image.")
        } catch FileManagerError.imageDataConversionError {
            print("Error while resizing image.")
        } catch {
            print("Error adding new pet with image")
        }
    }
}
