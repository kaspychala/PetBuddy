//
//  MainCoordinatorView.swift
//  Skapple
//
//  Created by Kasper Spychala on 24/10/2022.
//

import SwiftUI

struct MainCoordinatorView: View {

    // MARK: Stored Properties
    @ObservedObject var coordinator: MainCoordinator

    // MARK: Views
    var body: some View {
        TabView(selection: $coordinator.tab) {
            ClickerCoordinatorView(coordinator: coordinator.clickerCoordinator)
                .tabItem { Label("Clicker", systemImage: "speaker.wave.1") }
                .tag(AppTab.clicker)

            SettingsCoordinatorView(coordinator: coordinator.settingsCoordinator)
                .tabItem { Label("Settings", systemImage: "gear") }
                .tag(AppTab.settings)
        }
    }
}
