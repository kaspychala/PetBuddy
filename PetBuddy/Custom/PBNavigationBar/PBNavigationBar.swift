//
//  PBNavigationBar.swift
//  PetBuddy
//
//  Created by Adam Golczak on 13/06/2023.
//

import SwiftUI

struct PBNavigationBar: View {
	let title: String
	let subtitle: String?
	
	init(title: String, subtitle: String?) {
		self.title = title
		self.subtitle = subtitle
	}
	
	var body: some View {
		VStack(alignment: .leading, spacing: 4) {
			if subtitle != nil {
				Text(subtitle!)
					.fontWeight(.regular)
					.font(.system(size: 16.0))
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding([.leading, .trailing], 20.0)
					.foregroundColor(
						Color("NavigationBarSecondaryColor")
					)
			}
			Text(title)
				.fontWeight(.bold)
				.font(.system(size: 36.0))
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding([.leading, .trailing], 20.0)
				.foregroundColor(
					Color("NavigationBarPrimaryColor")
				)
		}
		.frame(width: UIScreen.main.bounds.width, height: 120.0)
	}
}

struct PBNavigationBar_Previews: PreviewProvider {
	static var previews: some View {
		PBNavigationBar(title: "Home", subtitle: "Wednesday, 8 March 2023")
	}
}
