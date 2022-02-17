//
//  EmojiMemoryGame.swift
//  Memorize_Lecture3
//
//  Created by Milad on 17.02.22.
//

import SwiftUI

class EmojiMemoryGame {
    static var emojis = ["🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚤", "🚙", "🚝", "🚲"]
    
    // A static func that just creates a MemoryGame<String> object
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in EmojiMemoryGame.emojis[pairIndex] }
    }
    
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
