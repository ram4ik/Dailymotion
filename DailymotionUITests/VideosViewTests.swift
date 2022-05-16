//
//  VideosViewTests.swift
//  DailymotionUITests
//
//  Created by Ramill Ibragimov on 15.05.2022.
//

import XCTest

class VideosViewTests: XCTestCase {

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
        
        videosTabButton.tap()
        XCTAssertTrue(channelTabButton.exists)
        XCTAssertTrue(videosTabButton.exists)
        
        let videosTitle: XCUIElement = app.staticTexts["Videos"]
        XCTAssertTrue(videosTitle.exists)
        
        app.swipeDown()
    }
    
    func testVideosList() {
        
        app.buttons["Videos"].tap()
        
        let videosListCellCount = app.tables.cells.count
        XCTAssertTrue(videosListCellCount > 0)
        
        let firstCell = app.tables.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.exists)
        firstCell.tap()
    }
}
