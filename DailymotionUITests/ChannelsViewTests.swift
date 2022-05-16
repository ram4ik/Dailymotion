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
        
        let channelTabButton: XCUIElement = app.buttons["Channels"]
        let videosTabButton: XCUIElement = app.buttons["Videos"]
        
        channelTabButton.tap()
        XCTAssertTrue(channelTabButton.exists)
        XCTAssertTrue(videosTabButton.exists)
        
        let channelsTitle: XCUIElement = app.staticTexts["Channels"]
        XCTAssertTrue(channelsTitle.exists)
        
        app.swipeDown()
    }
    
    func testChannelsList() {
        
        let channelListCellCount = app.tables.cells.count
        XCTAssertTrue(channelListCellCount > 0)
        
        let firstCell = app.tables.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.exists)
        firstCell.tap()
        
        XCTAssertTrue(app.staticTexts["Animals"].exists)
        
        let firstVideoChannelCellCount = app.tables.cells.count
        XCTAssertTrue(firstVideoChannelCellCount > 0)
        
        let firstVideoChannelCell = app.tables.cells.element(boundBy: 0)
        XCTAssertTrue(firstVideoChannelCell.exists)
        firstVideoChannelCell.tap()
        
        sleep(3)
        
        let backToAnimalsButton = app.buttons["Animals"]
        XCTAssertTrue(backToAnimalsButton.exists)
        backToAnimalsButton.tap()
        
        let backToChannelButton = app.buttons["Channels"]
        XCTAssertTrue(backToChannelButton.exists)
        
    }
}
