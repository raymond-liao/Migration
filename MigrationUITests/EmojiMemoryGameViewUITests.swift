//
//  EmojiMemoryGameViewUITests.swift
//  MigrationUITests
//
//  Created by raniys on 6/17/20.
//  Copyright © 2020 raniys. All rights reserved.
//

import XCTest
@testable import Migration

class EmojiMemoryGameViewUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCardCount() throws {
        let app = XCUIApplication()
        let cardViews = app.otherElements.matching(NSPredicate(format: "identifier CONTAINS 'card view'"))
        XCTAssertEqual(cardViews.count, 6)
    }
 
    func testCardContent() throws {
        let app = XCUIApplication()
        let card = app.otherElements["card view 1"]
        card.tap()
        XCTAssertEqual(app.staticTexts["card view 1"].label, "👻")
    }
    
    func testGameLogic() throws {
        let app = XCUIApplication()
        let cardViews = app.otherElements.matching(NSPredicate(format: "identifier CONTAINS 'card view'"))
        XCTAssertEqual(cardViews.count, 6)
        
        let cardOne = app.otherElements.matching(identifier: "card view 0").element
        cardOne.tap()
        XCTAssertEqual(cardViews.count, 5)
        
        let cardTwo = app.otherElements.matching(identifier: "card view 1").element
        cardTwo.tap()
        XCTAssertEqual(cardViews.count, 4)
        
        let cardThree = app.otherElements.matching(identifier: "card view 2").element
        cardThree.tap()
        XCTAssertEqual(cardViews.count, 3)
        
        let cardFour = app.otherElements.matching(identifier: "card view 3").element
        cardFour.tap()
        XCTAssertEqual(cardViews.count, 2)
        
        let cardFive = app.otherElements.matching(identifier: "card view 4").element
        cardFive.tap()
        XCTAssertEqual(cardViews.count, 1)
        
        let cardSix = app.otherElements.matching(identifier: "card view 5").element
        cardSix.tap()
        XCTAssertEqual(cardViews.count, 0)
    }
}
