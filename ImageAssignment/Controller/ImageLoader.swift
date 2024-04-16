//
//  ImageLoader.swift
//  ImageAssignment
//
//  Created by Savi Bhatia on 15/04/24.
//

import Foundation
import UIKit

class ImageLoader {
    static let shared = ImageLoader()
    private init() {}
    
    private var imageCache = NSCache<NSString, UIImage>()
    
    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        // Check if image is cached
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            completion(cachedImage)
            return
        }
        
        // If not cached, fetch image from URL
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            // Cache image
            self.imageCache.setObject(image, forKey: urlString as NSString)
            DispatchQueue.main.async {
                completion(image)
            }
        }
        task.resume()
    }
}
