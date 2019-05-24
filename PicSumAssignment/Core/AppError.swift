//
//  AppError.swift
//  PicSumAssignment
//
//  Created by Satyam Sehgal on 24/05/19.
//  Copyright © 2019 Satyam Sehgal. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case networkError
    case fetchError
    
    var errorMessage: String {
        switch self {
        case .networkError: return "Something went wrong!"
        case .fetchError: return "Unable to Fetch!"
        }
    }
}
