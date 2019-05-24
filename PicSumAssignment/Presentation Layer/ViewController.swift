//
//  ViewController.swift
//  PicSumAssignment
//
//  Created by Satyam Sehgal on 24/05/19.
//  Copyright © 2019 Satyam Sehgal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var photoDataSource = [PhotoCellModel]()
    let photoService = FetchPhotoService()
    
    // MARK: Variable/Constants
    var currentPageNumber = 1
    let itemsPerRow: CGFloat = 3.0
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPhotos()
        screenSetup()
    }

    private func screenSetup() {
         activityIndicator.startAnimating()
         activityIndicator.isHidden = false
         photoCollectionView.isHidden = true
    }
    
    func showErrorAlert() {
        Utility.showAlert(message: StringConstants.fetchErrorMsg, onController: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StringConstants.imageDetailSegue {
            let destinationVC = segue.destination as? PhotoDetailViewController
            if let indexPath = sender as? IndexPath {
                destinationVC?.model = self.photoDataSource[indexPath.row]
            }
        }
    }
}

// MARK: API Calls
extension ViewController {
    
    private func fetchPhotos() {
        photoService.fetchPhotos(with: .fetchPhotos(pageNumber: self.currentPageNumber)) {  [weak self] result in
            guard let self = self else { return }
            switch (result) {
            case .failure:
                self.showErrorAlert()
            case .success(let json):
                for jsonObject in json.arrayValue {
                    if let viewModel = ViewModel(json: jsonObject) {
                        let cellModel = PhotoCellModel.init(with: viewModel)
                        self.photoDataSource.append(cellModel)
                    }
                }
            }
            DispatchQueue.main.async {
                self.photoCollectionView.isHidden = false
                self.activityIndicator.isHidden = true
                self.photoCollectionView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
    }
}

