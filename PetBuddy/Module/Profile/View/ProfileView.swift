//
//  SettingsView.swift
//  Skapple
//
//  Created by Kasper Spychala on 21/10/2022.
//

import SwiftUI

struct ProfileView: View {

    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        Text(viewModel.title)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: .init(title: "Profile"))
    }
}
