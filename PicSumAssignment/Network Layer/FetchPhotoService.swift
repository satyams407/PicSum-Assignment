//
//  FetchPhotoService.swift
//  PicSumAssignment
//
//  Created by Satyam Sehgal on 24/05/19.
//  Copyright © 2019 Satyam Sehgal. All rights reserved.
//

import Foundation
import SwiftyJSON

class FetchPhotoService: FetchPhotoServiceProtocol {
    
    func fetchPhotos(with endPoint: FetchEndPoint, completionHandler:@escaping (Result<JSON,NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: buildRequest(endPoint: endPoint)) { (data, response, error) in
            guard let data = data else {
                completionHandler(.failure(.fetchError))
                return
            }
            do {
                completionHandler(.success(try JSON(data: data)))
            }
            catch( _) {
                completionHandler(.failure(.networkError))
            }
         }.resume()
    }
}
