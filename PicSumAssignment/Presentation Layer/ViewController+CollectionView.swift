//
//  ViewController+CollectionView.swift
//  PicSumAssignment
//
//  Created by Satyam Sehgal on 24/05/19.
//  Copyright © 2019 Satyam Sehgal. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return photoDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: StringConstants.photoCellIdentifier, for: indexPath)
        if let cell = collectionCell as? PhotoCollectionViewCell {
            cell.configureCell(with: photoDataSource[indexPath.row])
        }
        return collectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // set size according to the grid
        let padding: CGFloat = 30.0
        let availbleWidth = collectionView.frame.width - padding
        let height = (availbleWidth/itemsPerRow)
        return CGSize.init(width: availbleWidth/itemsPerRow, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard.init(name: StringConstants.mainStoryBoard, bundle: nil)
        if let detailVC = storyBoard.instantiateViewController(withIdentifier: StringConstants.imageVC ) as? PhotoDetailViewController {
            detailVC.model = self.photoDataSource[indexPath.row]
        }
        self.performSegue(withIdentifier: StringConstants.imageDetailSegue , sender: indexPath)
    }
    
}
