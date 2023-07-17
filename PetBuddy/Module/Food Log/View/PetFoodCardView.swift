//
//  PetFoodCardView.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 12/07/2023.
//

import SwiftUI

struct PetFoodCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .bottom, spacing: 16) {
                Text("Miki")
                    .font(.system(size: 21))
                    .bold()
                VStack(alignment: .trailing) {
                    Text("25%")
                    ProgressView(value: 25.0, total: 100)
                }
                .padding(.bottom, 5)
            }
            Spacer()
                .frame(height: 6)
            HStack {
                Text("Zapotrzebowanie kaloryczne")
                Spacer()
                Text("2137 kcal")
            }
            HStack {
                Text("Do tej pory wszamane")
                Spacer()
                Text("2137 kcal")
            }
            HStack {
                Text("Pozostało do zjedzenia")
                Spacer()
                Text("2137 kcal")
            }
            HStack {
                Text("Liczba posiłków")
                Spacer()
                Text("6")
            }

        }
        .padding([.leading, .trailing], 16)

    }
}

struct PetFoodCardView_Previews: PreviewProvider {
    static var previews: some View {
        PetFoodCardView()
    }
}
