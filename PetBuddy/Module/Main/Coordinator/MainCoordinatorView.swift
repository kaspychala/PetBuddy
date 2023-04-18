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
        CustomTabView(tabs: CustomAppTab.allCases, selectedTab: $coordinator.tab) { tab in
            getTabView(for: tab)
        }
    }

    @ViewBuilder
    func getTabView(for tab: CustomAppTab) -> some View {
        switch tab {
        case .home:
            HomeCoordinatorView(coordinator: coordinator.homeCoordinator)
        case .foodLog:
            FoodLogCoordinatorView(coordinator: coordinator.foodLogCoordinator)
        case .healthBook:
            HealthBookCoordinatorView(coordinator: coordinator.healthBookCoordinator)
        case .profile:
            ProfileCoordinatorView(coordinator: coordinator.profileCoordinator)
        }
    }
}
