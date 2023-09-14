//
//  HomeView.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 18/04/2023.
//

import SwiftUI

struct HomeView: View {
	@ObservedObject var viewModel: HomeViewModel
	
	var body: some View {
		VStack {
			PBNavigationBar(title: viewModel.title, subtitle: "Wednesday, 8 March 2023")
			Button("Food Checker") {
				viewModel.showFoodChecker()
			}
			Button("Clicker") {
				viewModel.showClicker()
			}
			Spacer()
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView(viewModel: .init(title: "Home"))
	}
}
