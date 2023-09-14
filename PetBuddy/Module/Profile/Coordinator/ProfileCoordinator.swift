//
//  SettingsCoordinator.swift
//  Skapple
//
//  Created by Kasper Spychala on 24/10/2022.
//

import SwiftUI

class ProfileCoordinator: ObservableObject, Identifiable {
	@Published var viewModel: ProfileViewModel
	@Published var addPetCoordinator: AddPetCoordinator
	@Published var shouldShowAddPet: Bool = false
	
	init(title: String) {
		self.viewModel = .init(title: title)
		self.addPetCoordinator = .init(title: "Add Pet")
		self.viewModel.coordinator = self
	}
	
	func showAddPet() {
		shouldShowAddPet = true
	}
}
