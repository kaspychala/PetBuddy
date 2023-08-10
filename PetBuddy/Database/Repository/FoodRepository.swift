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
        // TODO
    }

    func update(object: FoodModel) {
        // TODO
    }

    func delete(id: String) {
        // TODO
    }

    func get(id: String) -> FoodModel? {
        // TODO
        return nil
    }

    func getAll() -> [FoodModel]? {
        // TODO
        return nil
    }
}
