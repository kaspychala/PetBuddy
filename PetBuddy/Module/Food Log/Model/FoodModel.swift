//
//  FoodModel.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 01/08/2023.
//

import Foundation
import RealmSwift

class FoodModel: Object {
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var name: String
    @Persisted var kcal: Double
}
