//
//  MemoryGameTests.swift
//  MigrationTests
//
//  Created by raniys on 6/17/20.
//  Copyright © 2020 raniys. All rights reserved.
//

import XCTest
@testable import Migration

class MemoryGameTests: XCTestCase {

    let emojis = ["🐷", "🐍", "👻"]
    var gameModel: MemoryGame<String>?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        gameModel = MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        gameModel = nil
    }
    
    
    func testInitialize() throws {
        XCTAssertNotNil(gameModel)
    }
    
    func testCards() throws {
        XCTAssertEqual(emojis.count * 2, gameModel?.cards.count)
        
        var bufferCards = gameModel?.cards
        gameModel?.cards.forEach { card in
            XCTAssertFalse(card.isFaceUp)
            XCTAssertFalse(card.isMatched)
            XCTAssertTrue(emojis.contains(card.content))
            let index = bufferCards?.firstIndex(where: { $0.id == card.id })
            XCTAssertNotNil(index)
            bufferCards?.remove(at: index!)
        }
    }

    func testChooseCard() throws {
        let card = gameModel!.cards.first
        XCTAssertNotNil(card)
        
        gameModel!.choose(card!)
        XCTAssertEqual(card!.isFaceUp, !gameModel!.cards.first!.isFaceUp)
    }
    
    func testInitializePerformance() throws {
        let emojis = ["🐷", "🐍", "👻", "🐷", "🐍", "👻", "🐷", "🐍", "👻", "🐷", "🐍", "👻"]
        self.measure {
            let _ = MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
                return emojis[pairIndex]
            }
        }
    }
    
    func testChooseCardPerformance() throws {
        self.measure {
            gameModel?.cards.forEach { card in
                gameModel!.choose(card)
            }
        }
    }

}
