//
//  MealModel.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 01/08/2023.
//

import Foundation
import RealmSwift

class MealModel: Object {
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var petId: String
    @Persisted var foodId: String
    @Persisted var weight: Double
    @Persisted var date: Date
    @Persisted var createdAt: Date
}
