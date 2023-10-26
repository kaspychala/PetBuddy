//
//  HealthBookCoordinatorView.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 18/04/2023.
//

import SwiftUI

struct HealthBookCoordinatorView: View {
	
	// MARK: Stored Properties
	@ObservedObject var coordinator: HealthBookCoordinator
	
	// MARK: Views
	var body: some View {
		NavigationView {
			HealthBookView(viewModel: coordinator.viewModel)
                .navigationTitle("Health book")
                .navigationBarTitleDisplayMode(.large)
                .toolbar(.visible)
		}
	}
}
