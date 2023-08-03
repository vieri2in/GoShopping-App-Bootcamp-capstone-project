//
//  MarketView_UITests.swift
//  Li-Go-Shopping_UITests
//
//  Created by bin li on 5/14/23.
//

import XCTest

final class MarketViewUITests: XCTestCase {
  var app: XCUIApplication!
  override func setUpWithError() throws {
    try super.setUpWithError()
    continueAfterFailure = false
    app = XCUIApplication()
    app.launch()
  }
  override func tearDownWithError() throws {
  }
  func test_MarketView_SearchableShouldShowUp() throws {
    app.collectionViews.element.swipeLeft()
    app.collectionViews.element.swipeLeft()
    app.collectionViews.element.swipeLeft()
    app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Get Started"]/*[[".cells.buttons[\"Get Started\"]",".buttons[\"Get Started\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    let marketView = app.tabBars["Tab Bar"].buttons["Market"]
    marketView.tap()
    let searchHereSearchField = app
    // swiftlint:disable line_length
    /*@START_MENU_TOKEN@*/.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"]/*[[".otherElements[\"tabBar\"].navigationBars[\"_TtGC7SwiftUI32NavigationStackHosting\"]",".navigationBars[\"_TtGC7SwiftUI32NavigationStackHosting\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
      .searchFields["Search here..."]
    sleep(12)
    searchHereSearchField.tap()
    app.keys["A"].tap()
    app.keys["c"].tap()
    app.keys["e"].tap()
    app.keys["r"].tap()
    let acerMonitor = app
    /*@START_MENU_TOKEN@*/.scrollViews/*[[".otherElements[\"tabBar\"].scrollViews",".scrollViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
      .otherElements
      .staticTexts["Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin"]
    XCTAssertTrue(acerMonitor.exists)
  }
  func test_MarketView_SearchableShouldFail() throws {
    app.collectionViews.element.swipeLeft()
    app.collectionViews.element.swipeLeft()
    app.collectionViews.element.swipeLeft()
    app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Get Started"]/*[[".cells.buttons[\"Get Started\"]",".buttons[\"Get Started\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    let marketView = app.tabBars["Tab Bar"].buttons["Market"]
    marketView.tap()
    let searchHereSearchField = app
    
    /*@START_MENU_TOKEN@*/.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"]/*[[".otherElements[\"tabBar\"].navigationBars[\"_TtGC7SwiftUI32NavigationStackHosting\"]",".navigationBars[\"_TtGC7SwiftUI32NavigationStackHosting\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
      .searchFields["Search here..."]
    searchHereSearchField.tap()
    sleep(8)
    app.keys["A"].tap()
    app.keys["c"].tap()
    app.keys["e"].tap()
    app.keys["r"].tap()
    app.keys["r"].tap()
    let acerMoniter = app
    /*@START_MENU_TOKEN@*/.scrollViews/*[[".otherElements[\"tabBar\"].scrollViews",".scrollViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
      .otherElements
      .staticTexts["Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin"]
    XCTAssertTrue(!acerMoniter.exists)
  }
}
// swiftlint:enable line_length


