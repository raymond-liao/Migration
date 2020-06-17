//
//  MemoryGame.swift
//  Migration
//
//  Created by raniys on 6/17/20.
//  Copyright © 2020 raniys. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    
    var cards: Array<Card>
    
    mutating func choose(_ card: Card) {
        print("card chosen: \(card)")
        if let index = cards.firstIndex(matching: card) {
            self.cards[index].isFaceUp = !self.cards[index].isFaceUp
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
}
