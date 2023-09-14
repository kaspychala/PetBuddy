//
//  PetModel.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 01/08/2023.
//

import Foundation
import RealmSwift

class PetModel: Object, Identifiable {
	@Persisted(primaryKey: true) var id: String = UUID().uuidString
	@Persisted var name: String
	@Persisted var birthday: Date
	@Persisted var weight: Double
	@Persisted var dailyKcal: Double
	@Persisted var dailyMeals: Int
	@Persisted var photoName: String = UUID().uuidString
}
