//
//  PetRepository.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 01/08/2023.
//

import Foundation

class PetRepository: Repository {
    typealias T = PetModel
    
    func create(object: PetModel) {
        // TODO
    }

    func replace(id: String, object: PetModel) {
        // TODO
    }

    func update(object: PetModel) {
        // TODO
    }

    func delete(id: String) {
        // TODO
    }

    func get(id: String) -> PetModel? {
        // TODO
        return nil
    }

    func getAll(id: String) -> [PetModel?] {
        // TODO
        return [nil]
    }
}
