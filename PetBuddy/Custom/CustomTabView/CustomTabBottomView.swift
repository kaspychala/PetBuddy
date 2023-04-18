//
//  CustomTabBottomView.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 30/03/2023.
//

import SwiftUI

struct CustomTabBottomView: View {

    let tabs: [CustomAppTab]
    var height: CGFloat = 70
    var width: CGFloat = UIScreen.main.bounds.width - 32
    @Binding var selectedTab: CustomAppTab

    var body: some View {
        HStack {
            Spacer()
            ForEach(tabs) { tab in
                Button {
                    self.selectedTab = tab
                } label: {
                    let isSelected = selectedTab == tab
                    TabItemView(data: tab.tabItem, isSelected: isSelected)
                }
                Spacer()
            }
        }
        .frame(width: width, height: height)
        .background(Color.white)
        .cornerRadius(13)
        .shadow(radius: 5, x: 0, y: 4)
    }
}
