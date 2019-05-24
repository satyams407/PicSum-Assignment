//
//  PhotoDetailViewController.swift
//  PicSumAssignment
//
//  Created by Satyam Sehgal on 24/05/19.
//  Copyright © 2019 Satyam Sehgal. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var model: PhotoCellModel?
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var dimensionLabel: UILabel!
    
    let photoDetailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false // enables autolayout
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenSetup()
    }
    
    func screenSetup() {
        view.addSubview(photoDetailImageView)
        setUpLayout()
        authorLabel.text = "Author: \(model?.author ?? "")"
        idLabel.text = "Id: \(model?.id ?? "")"
        dimensionLabel.text = "Width: \(model?.width ?? 0)  Height: \(model?.height ?? 0)"
    }
    
    private func setUpLayout() {
        photoDetailImageView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        photoDetailImageView.heightAnchor.constraint(equalToConstant: view.frame.height - 180).isActive = true
        photoDetailImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        photoDetailImageView.bottomAnchor.constraint(equalToSystemSpacingBelow: authorLabel.topAnchor, multiplier: 10)
        photoDetailImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        photoDetailImageView.backgroundColor = .lightGray
        photoDetailImageView.sd_setImage(with: URL(string: model?.imageURL ?? ""), placeholderImage: UIImage(named: "placeHolder.png"))
    }
    
    @IBAction func cancelButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
