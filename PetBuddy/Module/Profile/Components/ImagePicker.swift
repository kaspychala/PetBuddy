//
//  ImagePicker.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 04/08/2023.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
	@Binding var image: UIImage?
	@Environment(\.presentationMode) private var presentationMode
	var sourceType: UIImagePickerController.SourceType = .photoLibrary
	
	func makeUIViewController(context: Context) -> UIImagePickerController {
		let imagePicker = UIImagePickerController()
		imagePicker.sourceType = sourceType
		imagePicker.modalPresentationStyle = .fullScreen
		imagePicker.delegate = context.coordinator
		return imagePicker
	}
	
	func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
	
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
	
	final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
		private let parent: ImagePicker
		
		init(_ parent: ImagePicker) {
			self.parent = parent
		}
		
		func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
			if let selectedImage = info[.originalImage] as? UIImage {
				parent.image = selectedImage
			}
			parent.presentationMode.wrappedValue.dismiss()
		}
		
		func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
			parent.presentationMode.wrappedValue.dismiss()
		}
	}
}
