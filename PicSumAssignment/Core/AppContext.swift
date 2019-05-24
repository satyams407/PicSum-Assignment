//
//  AppContext.swift
//  PicSumAssignment
//
//  Created by Satyam Sehgal on 24/05/19.
//  Copyright © 2019 Satyam Sehgal. All rights reserved.
//

import Foundation

struct AppContext {
    
    static let pageSize = 50
    
    struct AppConstants {
        
        enum HTTPMethod : String {
            case get = "GET"
            case post = "POST"
            case put = "PUT"
        }
    }
}
