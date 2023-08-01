//
//  PetModel.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 01/08/2023.
//

import Foundation
import RealmSwift

class PetModel: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var birthday: Date
    @Persisted var weight: Double
    @Persisted var dailyKcal: Double
    @Persisted var dailyMeals: Int
}
