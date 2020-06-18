//
//  Cardifier.swift
//  Migration
//
//  Created by raniys on 6/18/20.
//  Copyright © 2020 raniys. All rights reserved.
//

import SwiftUI

struct Cardifier: ViewModifier {
    
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }
    }
    
    // MARK: - Drawing Constants
    
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3
}


extension View {
    func cardifier(isFaceUp: Bool) -> some View {
        return self.modifier(Cardifier(isFaceUp: isFaceUp))
    }
}
