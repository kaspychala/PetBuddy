//
//  TabItemView.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 30/03/2023.
//

import SwiftUI

struct TabItemView: View {
    let data: CustomTabItemData
    let isSelected: Bool

    var body: some View {
        VStack {
            Image(systemName: isSelected ? data.selectedImage : data.image)
                .resizable()
                .tint(Color("PrimaryColor"))
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
                .animation(.default)

            Spacer().frame(height: 4)

            Text(data.title)
                .foregroundColor(isSelected ? .black : .gray)
                .font(.system(size: 14))
        }
    }
}
