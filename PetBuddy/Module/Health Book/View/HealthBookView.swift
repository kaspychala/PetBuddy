//
//  HealthBookView.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 18/04/2023.
//

import SwiftUI

struct HealthBookView: View {

    @ObservedObject var viewModel: HealthBookViewModel

    var body: some View {
        Text(viewModel.title)
    }
}

struct HealthBookView_Previews: PreviewProvider {
    static var previews: some View {
        HealthBookView(viewModel: .init(title: "HealthBook"))
    }
}
