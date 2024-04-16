//
//  ImageCell.swift
//  ImageAssignment
//
//  Created by Savi Bhatia on 15/04/24.
//

import Foundation
import UIKit

class ImageCell: UICollectionViewCell {
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageView() {
        imageView = UIImageView(frame: contentView.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        contentView.addSubview(imageView)
    }
    
    func configure(with image: UIImage) {
        imageView.image = image
    }
}
