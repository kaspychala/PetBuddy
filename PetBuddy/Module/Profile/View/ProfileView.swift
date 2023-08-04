//
//  SettingsView.swift
//  Skapple
//
//  Created by Kasper Spychala on 21/10/2022.
//

import SwiftUI

struct ProfileView: View {

    @ObservedObject var viewModel: ProfileViewModel
    @State private var image: UIImage?
    @State private var showImagePicker: Bool = false

    var body: some View {
        VStack {
            PBNavigationBar(title: viewModel.title, subtitle: nil)
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
            Spacer()
       }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: .init(title: "Profile"))
    }
}
