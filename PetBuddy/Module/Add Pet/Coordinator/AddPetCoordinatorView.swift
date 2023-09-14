//
//  AddPetCoordinatorView.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 07/08/2023.
//

import Foundation

import SwiftUI

struct AddPetCoordinatorView: View {
	
	// MARK: Stored Properties
	@ObservedObject var coordinator: AddPetCoordinator
	
	// MARK: Views
	var body: some View {
		NavigationView {
			AddPetView(viewModel: coordinator.viewModel)
		}
	}
}
