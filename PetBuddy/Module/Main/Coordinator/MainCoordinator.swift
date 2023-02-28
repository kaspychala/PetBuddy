//
//  MainCoordinator.swift
//  Skapple
//
//  Created by Kasper Spychala on 24/10/2022.
//

import Foundation
import SwiftUI

enum AppTab {
    case clicker
    case settings
}

class MainCoordinator: ObservableObject {
    
    @Published var tab = AppTab.clicker
    @Published var clickerCoordinator: ClickerCoordinator
    @Published var settingsCoordinator: SettingsCoordinator

    init() {
        self.clickerCoordinator = .init(title: "Clicker screen")
        self.settingsCoordinator = .init(title: "Settings screen")
    }
}
