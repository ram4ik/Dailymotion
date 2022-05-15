//
//  DailymotionUITestsMainUI.swift
//  DailymotionUITests
//
//  Created by Ramill Ibragimov on 15.05.2022.
//

import XCTest

class DailymotionUITestsMainUI: XCTestCase {

    var app: XCUIApplication = XCUIApplication()
    
    override func setUp() {
        app.launch()
    }
    
    override func tearDown() {
        app.terminate()
    }
    
    func testAppMainView() {
        
        let channelTabButton: XCUIElement = app.buttons["Channels"]
        let videosTabButton: XCUIElement = app.buttons["Videos"]
        
        for _ in 0...5 {
            videosTabButton.tap()
            channelTabButton.tap()
        }
    }
}
