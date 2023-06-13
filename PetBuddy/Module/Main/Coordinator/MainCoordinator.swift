//
//  MainCoordinator.swift
//  Skapple
//
//  Created by Kasper Spychala on 24/10/2022.
//

import Foundation
import SwiftUI

class MainCoordinator: ObservableObject {
    @Published var tab = CustomAppTab.home
    @Published var homeCoordinator: HomeCoordinator
    @Published var foodLogCoordinator: FoodLogCoordinator
    @Published var healthBookCoordinator: HealthBookCoordinator
    @Published var profileCoordinator: ProfileCoordinator

    init() {
        self.homeCoordinator = .init(title: "Home")
        self.foodLogCoordinator = .init(title: "Food Log")
        self.healthBookCoordinator = .init(title: "Health Book")
        self.profileCoordinator = .init(title: "Profile")
    }
}
