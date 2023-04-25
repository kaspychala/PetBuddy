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
    var width: CGFloat = UIScreen.main.bounds.width
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
        .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.15), radius: 24, x: 0, y: 0)
    }
}
