//
//  AddPetView.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 07/08/2023.
//

import SwiftUI

struct AddPetView: View {
	@ObservedObject var viewModel: AddPetViewModel
	
	@State private var name: String = ""
	@State private var birthday: String = ""
	@State private var weight: String = ""
	@State private var dailyKcal: String = ""
	@State private var dailyMeals: String = ""
	
	@State private var image: UIImage?
	@State private var showImagePicker: Bool = false
	
	var body: some View {
		VStack(spacing: 16) {
			if let image = image {
				Image(uiImage: image)
					.resizable()
					.aspectRatio(contentMode: .fit)
			} else {
				Text("No image selected")
			}
			
			Button("Select Image") {
				self.showImagePicker = true
			}
			.fullScreenCover(isPresented: $showImagePicker, content: {
				ImagePicker(image: self.$image, sourceType: .camera)
					.edgesIgnoringSafeArea(.all)
			})
			.padding()
			TextField("Name", text: $name)
				.textFieldStyle(.roundedBorder)
			TextField("Birthday", text: $birthday)
				.textFieldStyle(.roundedBorder)
			TextField("Weight", text: $weight)
				.textFieldStyle(.roundedBorder)
			TextField("Daily kcal", text: $dailyKcal)
				.textFieldStyle(.roundedBorder)
			TextField("Daily meals", text: $dailyMeals)
				.textFieldStyle(.roundedBorder)
			Button("Add") {
				let pet = PetModel()
				pet.name = name
				pet.birthday = Date()
				pet.weight = Double(weight) ?? 0.0
				pet.dailyKcal = Double(dailyKcal) ?? 0.0
				pet.dailyMeals = Int(dailyMeals) ?? 0
				viewModel.addPet(pet: pet, image: image)
			}
			Spacer()
		}
		.padding(16)
	}
}

struct AddPetView_Previews: PreviewProvider {
	static var previews: some View {
		AddPetView(viewModel: .init(title: "Add Pet"))
	}
}
