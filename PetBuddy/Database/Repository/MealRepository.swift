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
        // TODO
    }

    func update(object: MealModel) {
        // TODO
    }

    func delete(id: String) {
        // TODO
    }

    func get(id: String) -> MealModel? {
        // TODO
        return nil
    }

    func getAll() -> [MealModel]? {
        // TODO
        return nil
    }
}
