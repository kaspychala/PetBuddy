//
//  FoodCheckerViewModel.swift
//  PetBuddy-iOS
//
//  Created by Adam Golczak on 25/04/2023.
//

import Foundation

struct ResponseData: Decodable {
    var products: [Product]
}

struct Product: Decodable {
    var id = UUID()
    var name: String
    var dogs: Dogs
    var cats: Cats
    
    private enum CodingKeys: String, CodingKey {
        case name, dogs, cats
    }
}

struct Cats: Decodable {
    var safety_description: String
    var guidance: String
    var safe: Bool
}

struct Dogs: Decodable {
    var safety_description: String
    var guidance: String
    var safe: Bool
}

extension Product: Equatable {}

func ==(lhs: Product, rhs: Product) -> Bool {
    let areEqual = lhs.id == rhs.id

    return areEqual
}

class FoodCheckerViewModel: ObservableObject {

    @Published var products: [Product]?
    @Published var title: String
    weak var coordinator: FoodCheckerCoordinator?

    init(title: String) {
        self.title = title
    }
    
    func loadProductsFile() {
        if let url = Bundle.main.url(forResource: "products", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ResponseData.self, from: data)
                products = jsonData.products
            } catch {
                print("error: \(error)")
            }
        }
    }
}
