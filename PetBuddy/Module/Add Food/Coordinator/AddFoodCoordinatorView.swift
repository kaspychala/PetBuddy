//
//  AddFoodCoordinatorView.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 21/09/2023.
//

import Foundation
import SwiftUI

struct AddFoodCoordinatorView: View {

    // MARK: Stored Properties
    @ObservedObject var coordinator: AddFoodCoordinator

    // MARK: Views
    var body: some View {
        NavigationView {
            AddFoodView(viewModel: coordinator.viewModel)
        }
    }
}
