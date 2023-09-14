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
	let fileService: FileManagerService
	
	init(title: String) {
		self.title = title
		self.fileService = .shared
	}
	
	func showAddPet() {
		coordinator?.showAddPet()
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
