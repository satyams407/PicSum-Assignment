//
//  ViewModelTest.swift
//  PicSumAssignmentTests
//
//  Created by Satyam Sehgal on 24/05/19.
//  Copyright © 2019 Satyam Sehgal. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import PicSumAssignment

class ViewModelTest: XCTestCase {
    var viewModel: ViewModel?
    
    override func setUp() {
    }

    override func tearDown() {
       viewModel = nil
    }

    func testViewModelIntialisationSuccess() {
        let json: [String: Any] = [
            "id":"0",
            "author":"Alejandro Escamilla",
            "width":5616,
            "height":3744,
            "url":"https://unsplash.com/photos/yC-Yzbqy7PY",
            "download_url":"https://picsum.photos/id/0/5616/3744"
        ]
       
        let vehicleModel = ViewModel.init(json: JSON.init(json))
        XCTAssertTrue(vehicleModel != nil, "Succesfully initialise the model")
    }

}
