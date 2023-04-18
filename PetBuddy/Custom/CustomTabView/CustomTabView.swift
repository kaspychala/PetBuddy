//
//  CustomTabView.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 30/03/2023.
//

import SwiftUI

struct CustomTabView<Content: View>: View {

    let tabs: [CustomAppTab]
    @Binding var selectedTab: CustomAppTab
    @ViewBuilder let content: (CustomAppTab) -> Content

    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                ForEach(tabs) { tab in
                    content(tab)
                        .tag(tab)
                }
            }

            VStack {
                Spacer()
                CustomTabBottomView(tabs: tabs, selectedTab: $selectedTab)
            }
            .padding(.bottom, 8)
        }
    }
}
