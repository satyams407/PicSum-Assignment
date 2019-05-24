//
//  Utility.swift
//  PicSumAssignment
//
//  Created by Satyam Sehgal on 24/05/19.
//  Copyright © 2019 Satyam Sehgal. All rights reserved.
//

import UIKit

class Utility {
    static func instantiate(viewController controllerName: String, storyboardName: String = StringConstants.mainStoryBoard) -> UIViewController? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: controllerName)
    }
    
    static func showAlert(title: String = StringConstants.emptyString, message: String, onController controller: UIViewController) {
        DispatchQueue.main.async {
            let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            let dismissAction = UIAlertAction.init(title: StringConstants.okButtonTitle, style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(dismissAction)
            controller.present(alert, animated: true, completion: nil)
        }
    }
}
