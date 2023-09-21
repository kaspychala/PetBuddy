//
//  AddMealCoordinatorView.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 21/09/2023.
//

import Foundation
import SwiftUI

struct AddMealCoordinatorView: View {

    // MARK: Stored Properties
    @ObservedObject var coordinator: AddMealCoordinator

    // MARK: Views
    var body: some View {
        NavigationView {
            AddMealView(viewModel: coordinator.viewModel)
        }
    }
}
