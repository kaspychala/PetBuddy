//
//  FoodRepository.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 01/08/2023.
//

import Foundation
import RealmSwift

class FoodRepository: Repository {
	typealias T = FoodModel
	
	private let realm: Realm
	
	init() {
		realm = try! Realm()
	}
	
	func add(object: FoodModel) {
		try! realm.write {
			realm.add(object)
		}
	}
	
	func update(object: FoodModel) {
		let foods = realm.objects(FoodModel.self)
		guard let food = foods.first(where: {
			$0.id == object.id
		}) else {
			return
		}
		try! realm.write {
			food.name = object.name
			food.kcal = object.kcal
		}
	}
	
	func delete(id: String) {
		let foods = realm.objects(FoodModel.self)
		guard let food = foods.first(where: {
			$0.id == id
		}) else {
			return
		}
		try! realm.write {
			realm.delete(food)
		}
	}
	
	func get(id: String) -> FoodModel? {
		let foods = realm.objects(FoodModel.self)
		guard let food = foods.first(where: {
			$0.id == id
		}) else {
			return nil
		}
		return food
	}
	
	func getAll() -> [FoodModel]? {
		let objects = realm.objects(FoodModel.self)
		let foods = objects.toArray()
		guard !foods.isEmpty else {
			return nil
		}
		return foods
	}
}
