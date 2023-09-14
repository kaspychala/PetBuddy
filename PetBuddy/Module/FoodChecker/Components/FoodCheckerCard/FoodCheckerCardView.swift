//
//  FoodCheckerCardView.swift
//  PetBuddy-iOS
//
//  Created by Adam Golczak on 18/04/2023.
//

import SwiftUI

struct FoodCheckerCardView: View {
	@State var product: Product
	@Binding var animalType: AnimalType
	
	enum FoodStatus {
		enum Color: String {
			case allowed = "green"
			case moderateAmmount = "orange"
			case toxic = "red"
		}
		
	}
	
	func getIsSafeByAnimalType() -> Bool {
		return animalType == .dog ? product.dogs.safe : product.cats.safe
	}
	
	func getSafetyDescriptionByAnimalType() -> String {
		return animalType == .dog ? product.dogs.safetyDescription : product.cats.safetyDescription
	}
	
	func getGuidanceByAnimalType() -> String {
		return animalType == .dog ? product.dogs.guidance : product.cats.guidance
	}
	
	var body: some View {
		VStack(spacing: 20) {
			HStack {
				Text(product.name)
					.font(.system(size: 20.0, weight: .bold))
					.padding(.top, 4.0)
					.frame(maxWidth: .infinity, alignment: .leading)
				VStack(alignment: .trailing) {
					Text(getIsSafeByAnimalType() ? "Safe" : "Toxic")
						.font(.system(size: 12.0, weight: .bold))
						.foregroundColor(.white)
						.padding(8.0)
						.frame(maxWidth: .infinity, alignment: .trailing)
				}
				.fixedSize()
				.background(getIsSafeByAnimalType() ? .green : .red)
				.cornerRadius(8.0)
			}
			
			Text(getSafetyDescriptionByAnimalType())
				.lineSpacing(8.0)
				.font(.system(size: 14.0, weight: .regular))
				.frame(maxWidth: .infinity, alignment: .leading)
			Text(getGuidanceByAnimalType())
				.lineSpacing(8.0)
				.font(.system(size: 12.0, weight: .bold))
				.foregroundColor(.secondary)
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding(.bottom, 8.0)
		}
		.padding(16.0)
		.background(.white)
		.cornerRadius(16.0)
	}
}

struct FoodCheckerCardView_Previews: PreviewProvider {
	static var previews: some View {
		FoodCheckerCardView(product:
								Product(
									name: "Garlic",
									dogs: Dogs(
										safetyDescription: "Garlic is not recommended for dogs, as it can cause digestive issues and anemia if consumed in large amounts.",
										guidance: "Do not feed garlic to dogs.",
										safe: false
									),
									cats: Cats(
										safetyDescription: "Garlic is not recommended for cats, as it can cause digestive issues and anemia if consumed in large amounts.",
										guidance: "Do not feed garlic to cats.",
										safe: false
									)
								),
							animalType: .constant(.cat)
		)
	}
}
