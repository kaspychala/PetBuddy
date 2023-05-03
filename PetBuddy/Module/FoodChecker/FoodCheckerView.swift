//
//  FoodCheckerView.swift
//  PetBuddy-iOS
//
//  Created by Adam Golczak on 18/04/2023.
//

import SwiftUI

enum AnimalType: String, CaseIterable, Identifiable {
    case dog, cat
    var id: Self { self }
}

struct FoodCheckerView: View {
    
    // MARK: Stored Properties
    @ObservedObject var viewModel: FoodCheckerViewModel
    @State private var selectedAnimalType: AnimalType = .dog
    
    // MARK: Views
    var body: some View {
        VStack {
            Picker("Selected animal type", selection: $selectedAnimalType) {
                Text("Dog").tag(AnimalType.dog)
                Text("Cat").tag(AnimalType.cat)
            }.padding([.leading, .trailing], 16.0)
            List {
                if let products = viewModel.products {
                    ForEach(products, id:\.self.id) { product in
                        FoodCheckerCardView(product: product, animalType: $selectedAnimalType)
                            .shadow(
                                color: Color("BorderColor"),
                                radius: 16.0
                            )
                            .listRowSeparator(.hidden)
                    }
                    .listRowBackground(Color.clear)
                }
            }
            .onAppear {
                viewModel.loadProductsFile()
                print(viewModel.loadProductsFile())
            }
            .listStyle(.plain)
            .background(Color("Background"))
            .scrollContentBackground(.hidden)
            .safeAreaInset(edge: .top) {
                VStack {}
                    .padding(.top, 4.0)
            }
            .safeAreaInset(edge: .bottom) {
                VStack {}
                    .padding(.top, 50.0)
            }
        }
    }
}

struct FoodCheckerView_Previews: PreviewProvider {
    static var previews: some View {
        FoodCheckerView(viewModel: .init(title: "Food Checker"))
    }
}
