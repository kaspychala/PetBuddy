//
//  MealRepository.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 01/08/2023.
//

import Foundation
import RealmSwift

class MealRepository: Repository {
	typealias T = MealModel
	
	private let realm: Realm
	
	init() {
		realm = try! Realm()
	}
	
	func add(object: MealModel) {
		try! realm.write {
			realm.add(object)
		}
	}
	
	func update(object: MealModel) {
		let meals = realm.objects(MealModel.self)
		guard let meal = meals.first(where: {
			$0.id == object.id
		}) else {
			return
		}
		try! realm.write {
			meal.petId = object.petId
			meal.foodId = object.foodId
			meal.weight = object.weight
			meal.date = object.date
			meal.createdAt = object.createdAt
		}
	}
	
	func delete(id: String) {
		let meals = realm.objects(MealModel.self)
		guard let meal = meals.first(where: {
			$0.id == id
		}) else {
			return
		}
		try! realm.write {
			realm.delete(meal)
		}
	}
	
	func get(id: String) -> MealModel? {
		let meals = realm.objects(MealModel.self)
		guard let meal = meals.first(where: {
			$0.id == id
		}) else {
			return nil
		}
		return meal
	}
	
	func getAll() -> [MealModel]? {
		let objects = realm.objects(MealModel.self)
		let meals = objects.toArray()
		guard !meals.isEmpty else {
			return nil
		}
		return meals
	}
}
