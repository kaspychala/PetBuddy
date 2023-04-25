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
                .frame(width: 24, height: 24)
                .animation(.easeIn)

            Spacer().frame(height: 8)

            Text(data.title)
                .foregroundColor(isSelected ? .black : .gray)
                .font(.system(size: 11))
                .fontWeight(.medium)
        }
    }
}
