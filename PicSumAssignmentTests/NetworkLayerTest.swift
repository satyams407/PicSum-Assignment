//
//  NetworkLayerTest.swift
//  PicSumAssignmentTests
//
//  Created by Satyam Sehgal on 25/05/19.
//  Copyright © 2019 Satyam Sehgal. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import PicSumAssignment

class MockFetchPhotoService: FetchPhotoServiceProtocol {
    var responseString: String? = nil
    func fetchPhotos(with endPoint: FetchEndPoint, completionHandler: @escaping (Result<JSON, NetworkError>) -> Void) {
        guard let data = responseString?.data(using: .utf8) else {
            DispatchQueue.main.async {
                completionHandler(.failure(.fetchError))
            }
            return
        }
        do {
            completionHandler(.success(try JSON(data: data)))
        }
        catch( _) {
            completionHandler(.failure(.networkError))
        }
    }
}
class NetworkLayerTest: XCTestCase {
    var mockFetchPhotoService: MockFetchPhotoService?
    var fetchEndPoint: FetchEndPoint?
    
    override func setUp() {
        mockFetchPhotoService = MockFetchPhotoService()
    }

    override func tearDown() {
        mockFetchPhotoService = nil
        fetchEndPoint = nil
    }

    func testEncoding() {
        guard let url = URL(string: "https://picsum.photos/v2/list") else {
            XCTFail("cannot convert the string into url")
            return
        }
        
        let parameters = ["page": 1, "limit": 100]
        
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            XCTFail("URl Components not made")
            return
        }
        guard let _ = URLRequest.init(url: url).url else {
            XCTFail("Request URl request not made")
            return
        }
        components.queryItems = [URLQueryItem]()
        for (key,value) in parameters {
            let queryItem = URLQueryItem(name: key,
                                         value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
            components.queryItems?.append(queryItem)
        }
        let expectedURL = "https://picsum.photos/v2/list?page=1&limit=100"
        
        XCTAssertEqual(expectedURL.sorted(), components.url?.absoluteString.sorted(), "Succesully build the url")
    }
}
