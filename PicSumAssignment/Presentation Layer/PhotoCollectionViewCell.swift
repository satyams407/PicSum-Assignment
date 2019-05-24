//
//  PhotoCollectionViewCell.swift
//  PicSumAssignment
//
//  Created by Satyam Sehgal on 24/05/19.
//  Copyright © 2019 Satyam Sehgal. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    func configureCell(with cellModel: PhotoCellModel) {
        let url = URL.init(string: cellModel.imageURL)
        photoImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "placeHolder.png"))
        photoImageView.contentMode = .scaleAspectFill
    }
    
}
