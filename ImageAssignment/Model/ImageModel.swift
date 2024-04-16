//
//  ImageModel.swift
//  ImageAssignment
//
//  Created by Savi Bhatia on 15/04/24.
//

import Foundation
import UIKit

struct ImageModel {
    let id: UUID
    let url: String
    var cachedImage: UIImage? // You may choose to store the cached image data
    
    init(url: String) {
        self.id = UUID() // Generate a unique identifier for each image
        self.url = url
        self.cachedImage = nil // Initialize cached image as nil
    }
}
