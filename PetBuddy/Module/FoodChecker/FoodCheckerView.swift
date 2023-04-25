//
//  FoodCheckerView.swift
//  PetBuddy-iOS
//
//  Created by Adam Golczak on 18/04/2023.
//

import SwiftUI

struct FoodCheckerView: View {
    enum AnimalType: String, CaseIterable, Identifiable {
        case dog, cat
        var id: Self { self }
    }
    
    @State private var selectedAnimalType: AnimalType = .dog
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            NavigationStack {
                Picker("Selected animal type", selection: $selectedAnimalType) {
                    Text("Dog").tag(AnimalType.dog)
                    Text("Cat").tag(AnimalType.cat)
                }
                
                List {
                    ForEach(1...5, id:\.self) { _ in
                        FoodCheckerCardView()
                            .listRowSeparator(.hidden)
                            .padding(.bottom, 4.0)
                    }
                    .listRowBackground(Color.clear)
                }
                .listStyle(PlainListStyle())
                .background(.orange)
                .scrollContentBackground(.hidden)
            }
            .searchable(text: $searchText)
            .pickerStyle(.segmented)
        }
    }
}

struct FoodCheckerView_Previews: PreviewProvider {
    static var previews: some View {
        FoodCheckerView()
    }
}
