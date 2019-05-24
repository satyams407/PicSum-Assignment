//
//  FetchEndPoint.swift
//  PicSumAssignment
//
//  Created by Satyam Sehgal on 24/05/19.
//  Copyright © 2019 Satyam Sehgal. All rights reserved.
//

import Foundation

typealias Parameters = [String: Any]

enum FetchEndPoint {
    case fetchPhotos(pageNumber: Int)
}

extension FetchEndPoint {
    var baseURL: URL {
        guard let url = URL(string: AppURLConstants.basefetchURL) else {
            fatalError("url can't be made right now")
        }
        return url
    }
    
    var httpMethod: AppContext.AppConstants.HTTPMethod {
        return .get
    }
    
    var urlParameters: Parameters {
        switch self {
        case .fetchPhotos(let pageNo):
            return [
                "page": pageNo,
                "limit": AppContext.pageSize
            ]
        }
    }
    
    func encode(request: inout URLRequest, urlParameters: Parameters?) {
        guard let urlParameters = urlParameters, let url = request.url  else { return }
        //https://picsum.photos/v2/list?page=1&limit=10
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) {
            urlComponents.queryItems = [URLQueryItem]()
            for (key,value) in urlParameters {
                let queryItem = URLQueryItem(name: key,
                                             value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponents.queryItems?.append(queryItem)
            }
            request.url = urlComponents.url
        }
    }
}
