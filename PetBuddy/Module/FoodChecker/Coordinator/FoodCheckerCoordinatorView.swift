//
//  FoodCheckerCoordinatorView.swift
//  PetBuddy-iOS
//
//  Created by Adam Golczak on 25/04/2023.
//

import SwiftUI

struct FoodCheckerCoordinatorView: View {

    // MARK: Stored Properties
    @ObservedObject var coordinator: FoodCheckerCoordinator
    @State private var searchText = ""

    // MARK: Views
    var body: some View {
        FoodCheckerView(viewModel: coordinator.viewModel)
            .navigationBarTitleDisplayMode(.automatic)
            .searchable(text: $searchText)
            .pickerStyle(.segmented)
            .navigationTitle("Food Checker")
    }
}
