//
//  MemoryGame.swift
//  Memorize_Assignment2
//
//  Created by Milad on 20.02.22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable  {
    private(set) var cards: Array<Card>
    private(set) var flippedCards: Array<Card> = Array<Card>()
    private(set) var points = 0
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        // If there is a card that matches my card return it's index
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched {
            
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    points += 2
                }
                
                // When matching see if card was already flipped, if so penalize
                if flippedCards.contains(cards[chosenIndex]) {
                    points -= 1
                }
                
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            
            // Add card to flipped aka. mark it as flipped
            if !flippedCards.contains(cards[chosenIndex]) {
                flippedCards.append(cards[chosenIndex])
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        
        // Shuffle the cards
        cards.shuffle()
    }
    
    struct Card: Identifiable, Equatable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        
        var id: Int
    }
    
    struct Theme {
        var name: String
        var emojis: [String]
        var numberOfPairsOfCards: Int
        var color: String
    }
}
