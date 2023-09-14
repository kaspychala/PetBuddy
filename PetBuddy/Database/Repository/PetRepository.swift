//
//  PetRepository.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 01/08/2023.
//

import Foundation
import RealmSwift

class PetRepository: Repository {
	typealias T = PetModel
	
	private let realm: Realm
	
	init() {
		realm = try! Realm()
	}
	
	func add(object: PetModel) {
		try! realm.write {
			realm.add(object)
		}
	}
	
	func update(object: PetModel) {
		let pets = realm.objects(PetModel.self)
		guard let pet = pets.first(where: {
			$0.id == object.id
		}) else {
			return
		}
		try! realm.write {
			pet.name = object.name
			pet.birthday = object.birthday
			pet.weight = object.weight
			pet.dailyKcal = object.dailyKcal
			pet.dailyMeals = object.dailyMeals
			pet.photoName = object.photoName
		}
	}
	
	func delete(id: String) {
		let pets = realm.objects(PetModel.self)
		guard let pet = pets.first(where: {
			$0.id == id
		}) else {
			return
		}
		try! realm.write {
			realm.delete(pet)
		}
	}
	
	func get(id: String) -> PetModel? {
		let pets = realm.objects(PetModel.self)
		guard let pet = pets.first(where: {
			$0.id == id
		}) else {
			return nil
		}
		return pet
	}
	
	func getAll() -> [PetModel]? {
		let objects = realm.objects(PetModel.self)
		let pets = objects.toArray()
		guard !pets.isEmpty else {
			return nil
		}
		return pets
	}
}
