//
//  HomeViewModel.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 18/04/2023.
//

import SwiftUI

class HomeViewModel: ObservableObject {
	
	@Published var title: String
	weak var coordinator: HomeCoordinator?
	
	init(title: String) {
		self.title = title
	}
	
	func showFoodChecker() {
		coordinator?.showFoodChecker()
	}
	
	func showClicker() {
		coordinator?.showClicker()
	}
}
