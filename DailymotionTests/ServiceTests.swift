//
//  ServiceTests.swift
//  DailymotionTests
//
//  Created by Ramill Ibragimov on 15.05.2022.
//

import XCTest
import SwiftUI
@testable import Dailymotion

class ServiceTests: XCTestCase {

    func testInstanceOfService() {
        
        let service = Service()
        XCTAssertNotNil(service)
    }
    
    func testGetVideoDetailsForFakeId() {
        
        @ObservedObject var service: Service
        
        service = Service()
        service.getVideoDetails(videoId: "test")
        
        XCTAssertNil(service.videoDetails)
    }
    
    func testGetVideoDetailsForId() {
        
        @ObservedObject var service: Service
        
        service = Service()
        service.getVideoDetails(videoId: "x26ezj5")
        
        XCTAssertNil(service.videoDetails)
        
    }
    
}
