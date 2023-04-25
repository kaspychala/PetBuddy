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
    
    var body: some View {
        VStack {
            Picker("Selected animal type", selection: $selectedAnimalType) {
                Text("Dog").tag(AnimalType.dog)
                Text("Cat").tag(AnimalType.cat)
            }.padding([.leading, .trailing], 15.0)
            
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
    }
}

struct FoodCheckerView_Previews: PreviewProvider {
    static var previews: some View {
        FoodCheckerView()
    }
}
