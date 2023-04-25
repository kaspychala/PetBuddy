//
//  FoodLogCoordinatorView.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 18/04/2023.
//

import SwiftUI

struct FoodLogCoordinatorView: View {

    // MARK: Stored Properties
    @ObservedObject var coordinator: FoodLogCoordinator

    // MARK: Views
    var body: some View {
        NavigationView {
//            FoodLogView(viewModel: coordinator.viewModel)
            FoodCheckerView()
        }
    }
}
