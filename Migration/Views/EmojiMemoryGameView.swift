//
//  EmojiMemoryGameView.swift
//  Migration
//
//  Created by raniys on 6/17/20.
//  Copyright © 2020 raniys. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card)
            }
            .padding()
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110 - 90), clockwise: true)
                    .padding(5).opacity(0.4)
                Text(card.content).font(Font.system(size: fontSize(for: size)))
            }
            .cardifier(isFaceUp: card.isFaceUp)
        }
    }
    
    // MARK: - Drawing Constants

    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
