//
//  Repository.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 01/08/2023.
//

import Foundation

protocol Repository {
    associatedtype T

    func add(object: T)
    func update(object: T)
    func delete(id: String)
    func get(id: String) -> T?
    func getAll() -> [T]?
}
