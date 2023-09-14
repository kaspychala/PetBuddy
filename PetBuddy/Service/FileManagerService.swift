//
//  FileManager.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 10/08/2023.
//

import Foundation
import SwiftUI

enum FileManagerError: Error {
	case documentDirectoryNotFound
	case fileWriteError
	case fileReadError
	case imageDataConversionError
	case fileDeleteError
}

class FileManagerService {
	static let shared = FileManagerService()
	
	private let fileManager = FileManager.default
	
	// Function to save an image to a file and resize if necessary
	func saveImage(_ image: UIImage, fileName: String, maxHeight: CGFloat) throws {
		guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
			throw FileManagerError.documentDirectoryNotFound
		}
		
		let fileURL = documentDirectory.appendingPathComponent(fileName)
		
		var resizedImage: UIImage
		if image.size.height > maxHeight {
			let scaleFactor = maxHeight / image.size.height
			let newWidth = image.size.width * scaleFactor
			UIGraphicsBeginImageContext(CGSize(width: newWidth, height: maxHeight))
			image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: maxHeight))
			resizedImage = UIGraphicsGetImageFromCurrentImageContext() ?? image
			UIGraphicsEndImageContext()
		} else {
			resizedImage = image
		}
		
		if let data = resizedImage.jpegData(compressionQuality: 0.8) {
			do {
				try data.write(to: fileURL)
			} catch {
				throw FileManagerError.fileWriteError
			}
		} else {
			throw FileManagerError.imageDataConversionError
		}
	}
	
	// Function to delete an image file
	func deleteImage(fileName: String) throws {
		guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
			throw FileManagerError.documentDirectoryNotFound
		}
		
		let fileURL = documentDirectory.appendingPathComponent(fileName)
		
		do {
			try fileManager.removeItem(at: fileURL)
		} catch {
			throw FileManagerError.fileDeleteError
		}
	}
	
	// Function to load an image from a file
	func loadImage(fileName: String) throws -> UIImage {
		guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
			throw FileManagerError.documentDirectoryNotFound
		}
		
		let fileURL = documentDirectory.appendingPathComponent(fileName)
		
		do {
			let data = try Data(contentsOf: fileURL)
			if let image = UIImage(data: data) {
				return image
			} else {
				throw FileManagerError.imageDataConversionError
			}
		} catch {
			throw FileManagerError.fileReadError
		}
	}
}
