//
//  BackLogV2Tests.swift
//  BackLogV2Tests
//
//  Created by Gregory Keeley on 12/27/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import XCTest
@testable import BackLogV2

class BackLogV2Tests: XCTestCase {
    
    func testIGDBSearchModel() {
        let expectedcount = 3
        let exp = XCTestExpectation(description: "Games found")
        GameSearchAPI.searchIGDB(for: "Futurama)") { (result) in
            switch result {
            case .failure(let appError):
                XCTFail("Failed with: \(appError)")
            case .success(let games):
                    exp.fulfill()
                    XCTAssertEqual(expectedcount, games.count)
            }

        }
    }
}
