//
//  CustomTabType.swift
//  PetBuddy-Tests
//
//  Created by Kasper Spychala on 18/04/2023.
//

import Foundation

enum CustomTabType: Int, CaseIterable {
    case home = 0
    case foodLog = 1
    case healthBook = 2
    case profile = 3


    var tabItem: CustomTabItemData {
        switch self {
        case .home:
            return CustomTabItemData(
                image: "house",
                selectedImage: "house.fill",
                title: "Home")
        case .foodLog:
            return CustomTabItemData(
                image: "carrot",
                selectedImage: "carrot.fill",
                title: "Food Log")
        case .healthBook:
            return CustomTabItemData(
                image: "menucard",
                selectedImage: "menucard.fill",
                title: "Health Book")
        case .profile:
            return CustomTabItemData(
                image: "person.crop.circle",
                selectedImage: "person.crop.circle.fill",
                title: "Health Book")
        }
    }
}
