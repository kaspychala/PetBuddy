//
//  MealModel.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 01/08/2023.
//

import Foundation
import RealmSwift

class MealModel: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var petId: Int
    @Persisted var foodId: Int
    @Persisted var weight: Int
    @Persisted var date: String
    @Persisted var createdAt: Date
}
