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
            Text("Wednesday, 8 March 2023")
                .fontWeight(.regular)
                .font(.system(size: 16.0))
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding([.leading, .trailing], 16.0)
                .foregroundColor(
                    Color("NavigationBarSecondaryColor")
                )
//			PBNavigationBar(title: viewModel.title, subtitle: "Wednesday, 8 March 2023")
            Spacer()
                .frame(height: 32.0)
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
