//
//  EmojiMemoryGame.swift
//  Migration
//
//  Created by raniys on 6/17/20.
//  Copyright © 2020 raniys. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["🐷", "🐍", "👻"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    
    // MARK: - Access to Model
    
    var cards: Array<MemoryGame<String>.Card> { model.cards }
    
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
