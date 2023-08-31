//
//  FoodCardView.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 12/07/2023.
//

import SwiftUI

struct FoodCardView: View {
    @State var foodCardModel: FoodCardModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .bottom, spacing: 16) {
                Text(foodCardModel.petName)
                    .font(.system(size: 21))
                    .bold()
                VStack(alignment: .trailing) {
                    Text("\((foodCardModel.kcalEaten / foodCardModel.kcalNeeded) * 100)%")
                    ProgressView(value: foodCardModel.kcalEaten / foodCardModel.kcalNeeded, total: 1.0)
                }
                .padding(.bottom, 5)
            }
            Spacer()
                .frame(height: 6)
            HStack {
                Text("Zapotrzebowanie kaloryczne")
                Spacer()
                Text(String(foodCardModel.kcalNeeded))
            }
            HStack {
                Text("Do tej pory wszamane")
                Spacer()
                Text(String(foodCardModel.kcalEaten))
            }
            HStack {
                Text("Pozostało do zjedzenia")
                Spacer()
                Text(String(foodCardModel.kcalLeft))
            }
            HStack {
                Text("Liczba posiłków")
                Spacer()
                Text(String(foodCardModel.totalMealsEaten))
            }

        }
        .padding([.leading, .trailing, .top, .bottom], 16)

    }
}

struct FoodCardView_Previews: PreviewProvider {
    static var previews: some View {
        FoodCardView(
            foodCardModel: FoodCardModel(petName: "Miki", kcalNeeded: 500, kcalEaten: 250, kcalLeft: 250, totalMealsEaten: 4))
    }
}
