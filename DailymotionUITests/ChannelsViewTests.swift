//
//  ChannelsViewTests.swift
//  DailymotionUITests
//
//  Created by Ramill Ibragimov on 15.05.2022.
//

import XCTest

class ChannelsViewTests: XCTestCase {

    var app: XCUIApplication = XCUIApplication()
    
    override func setUp() {
        app.launch()
    }
    
    override func tearDown() {
        app.terminate()
    }
    
    func testAppMainView() {
        
        let channelTabButton: XCUIElement = app.buttons["Channel"]
        let videosTabButton: XCUIElement = app.buttons["Videos"]
        
        channelTabButton.tap()
        XCTAssertTrue(channelTabButton.exists)
        XCTAssertTrue(videosTabButton.exists)
        
        let channelsTitle: XCUIElement = app.staticTexts["Channels"]
        XCTAssertTrue(channelsTitle.exists)
        
        app.swipeDown()
    }
}
