//
//  DailymotionTests.swift
//  DailymotionTests
//
//  Created by Ramill Ibragimov on 15.05.2022.
//

import XCTest
@testable import Dailymotion

class NetworkManagerTests: XCTestCase {
    
    func testInstanceOfNetworkManager() {
        
        let networkManager = NetworkManager()
        XCTAssertNotNil(networkManager)
    }
}
