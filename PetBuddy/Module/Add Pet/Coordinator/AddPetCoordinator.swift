//
//  AddPetCoordinator.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 07/08/2023.
//

import Foundation
import SwiftUI

class AddPetCoordinator: ObservableObject, Identifiable {
	@Published var viewModel: AddPetViewModel
	
	init(title: String) {
		self.viewModel = .init(title: title)
		self.viewModel.coordinator = self
	}
}
