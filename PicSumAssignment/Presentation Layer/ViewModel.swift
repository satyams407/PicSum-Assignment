//
//  ViewModel.swift
//  PicSumAssignment
//
//  Created by Satyam Sehgal on 24/05/19.
//  Copyright © 2019 Satyam Sehgal. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ViewModel: Codable {
    let id, author: String
    let width, height: Int
    let url, downloadURL: String
    
    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
    
    init?(json: JSON) {
        guard let jsonData = try? json.rawData(), let jsonModel = try? JSONDecoder().decode(ViewModel.self, from: jsonData) else {
            return nil
        }
        self = jsonModel
    }
}
