//
//  PhotoCellModel.swift
//  PicSumAssignment
//
//  Created by Satyam Sehgal on 24/05/19.
//  Copyright © 2019 Satyam Sehgal. All rights reserved.
//

import Foundation

class PhotoCellModel {
    let imageURL, author, id: String
    let width, height: Int
    
    required init (with viewModel: ViewModel) {
        self.imageURL = viewModel.downloadURL
        self.author = viewModel.author
        self.id = viewModel.id
        self.width = viewModel.width
        self.height = viewModel.height
    }
}
