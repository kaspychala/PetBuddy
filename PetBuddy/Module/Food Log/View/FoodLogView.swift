//
//  FoodLogView.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 18/04/2023.
//

import SwiftUI

struct FoodLogView: View {

    @ObservedObject var viewModel: FoodLogViewModel

    var body: some View {
        Text(viewModel.title)
    }
}

struct FoodLogView_Previews: PreviewProvider {
    static var previews: some View {
        FoodLogView(viewModel: .init(title: "FoodLog"))
    }
}