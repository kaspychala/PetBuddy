//
//  HealthBookCoordinator.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 18/04/2023.
//

import SwiftUI

class HealthBookCoordinator: ObservableObject, Identifiable {
	
	@Published var viewModel: HealthBookViewModel
	
	init(title: String) {
		self.viewModel = .init(title: title)
		self.viewModel.coordinator = self
	}
}
