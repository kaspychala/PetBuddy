//
//  PetBuddyApp.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 28/02/2023.
//

import SwiftUI

@main
struct PetBuddyApp: App {

    // MARK: Stored Properties
    @StateObject var coordinator = MainCoordinator()

    // MARK: Scenes
    var body: some Scene {
        WindowGroup {
            MainCoordinatorView(coordinator: coordinator)
        }
    }
}
