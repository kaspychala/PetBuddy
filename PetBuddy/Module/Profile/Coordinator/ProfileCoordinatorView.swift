//
//  SettingsCoordinatorView.swift
//  Skapple
//
//  Created by Kasper Spychala on 24/10/2022.
//

import SwiftUI

struct ProfileCoordinatorView: View {
    
    // MARK: Stored Properties
    @ObservedObject var coordinator: ProfileCoordinator

    // MARK: Views
    var body: some View {
        NavigationView {
            ProfileView(viewModel: coordinator.viewModel)
        }
    }
}
