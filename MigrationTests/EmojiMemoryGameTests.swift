//
//  EmojiMemoryGameTests.swift
//  MigrationTests
//
//  Created by raniys on 6/17/20.
//  Copyright © 2020 raniys. All rights reserved.
//

import XCTest
@testable import Migration

class EmojiMemoryGameTests: XCTestCase {
    
    var viewModel: EmojiMemoryGame?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = EmojiMemoryGame()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        viewModel = nil
    }

    func testInitialize() throws {
        XCTAssertNotNil(viewModel)
        XCTAssertTrue(viewModel!.cards.count > 0)
    }
    
    func testCards() throws {
        let emojis = ["👻", "👽", "🐍"]
        XCTAssertEqual(emojis.count * 2, viewModel!.cards.count)
        
        var bufferCards = viewModel!.cards
        viewModel!.cards.forEach { card in
            XCTAssertFalse(card.isFaceUp)
            XCTAssertFalse(card.isMatched)
            XCTAssertTrue(emojis.contains(card.content))
            let index = bufferCards.firstIndex(where: { $0.id == card.id })
            XCTAssertNotNil(index)
            bufferCards.remove(at: index!)
        }
    }
    
    func testChooseCard() throws {
        let card = viewModel!.cards.first
        XCTAssertNotNil(card)
        
        viewModel!.choose(card!)
        XCTAssertEqual(card!.isFaceUp, !viewModel!.cards.first!.isFaceUp)
    }
    
    
    func testInitializePerformance() throws {
        self.measure {
            let _ = EmojiMemoryGame()
        }
    }
    
    func testChooseCardPerformance() throws {
        self.measure {
            viewModel!.cards.forEach { card in
                viewModel!.choose(card)
            }
        }
    }
}
