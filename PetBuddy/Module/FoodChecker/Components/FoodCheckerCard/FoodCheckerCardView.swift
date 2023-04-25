//
//  FoodCheckerCardView.swift
//  PetBuddy-iOS
//
//  Created by Adam Golczak on 18/04/2023.
//

import SwiftUI

struct FoodCheckerCardView: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("Chicken Breast")
                .font(.system(size: 28.0, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Toxic")
                .font(.system(size: 14.0, weight: .bold))
                .foregroundColor(.red)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("I love chicken. But it's toxic like Britney Spears. I have to reconsiderate this relationship now.")
                .font(.system(size: 16.0, weight: .regular))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .shadow(radius: 20.0)
        .padding(16.0)
        .background(.white)
        .cornerRadius(16.0)
    }
}

struct FoodCheckerCardView_Previews: PreviewProvider {
    static var previews: some View {
        FoodCheckerCardView()
    }
}
