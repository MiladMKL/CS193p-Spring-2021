//
//  EmojiMemoryGame.swift
//  Memorize_Assignment2
//
//  Created by Milad on 20.02.22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    // Typealias to rename MemoryGame<String>.Theme to Theme
    typealias Theme = MemoryGame<String>.Theme
    
    static let emojisDictionary = [
        "Halloween" : ["🎃", "💀", "🧙‍♀️", "🏚", "👻", "⚰️"],
        "Vehicles" : ["🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚤", "🚙", "🚝", "🚲"],
        "Flags" : ["🇦🇫", "🇦🇱", "🇧🇷", "🇩🇪", "🇫🇷", "🇯🇵", "🇯🇲", "🇺🇸", "🇦🇹", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇬🇷", "🇻🇪", "🇷🇺", "🇦🇱", "🇵🇹", "🇦🇲", "🇮🇱"],
        "Sports" : ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏏", "⛳️", "🥌", "🏑"],
        "Animals" : ["🐎", "🐪", "🐘", "🐬", "🐖", "🐄"],
        "Fruits" : ["🍎", "🍋", "🍌", "🍒", "🍑", "🍇", "🍉", "🍊", "🍓", "🍍", "🥝"]
    ]
    
    static let colors = ["black", "red", "green", "blue", "orange", "brown", "magenta", "fuchsia"]
    
    static func getColor(_ color: String) -> Color {
        switch color {
        case "red":
            return .red
        case "black":
            return .black
        case "green":
            return .green
        case "blue":
            return .blue
        case "orange":
            return .orange
        case "brown":
            return .brown
        default:
            return .red
        }
    }
    
    private(set) var currentTheme: Theme
    private(set) var chosenColor: Color
    
    @Published private var model: MemoryGame<String>
    
    // Create all themes when the game starts
    static var allThemes: [Theme] = EmojiMemoryGame.createThemes()
    
    static func createThemes() -> [Theme] {
        var themes = [Theme]()
        let numberOfCards = 8
        var themeColors = colors.shuffled()
        
        for (name, emojis) in emojisDictionary {
            themes.append(createTheme(name, emojis, numberOfCards, themeColors.removeLast()))
        }
        
        return themes
    }
    
    static func createTheme(_ name: String, _ emojis: [String], _ numberOfPairsOfCards: Int, _ color: String) -> Theme {
        
        // If there are less emojis than number of cards
        var defaultPairsOfCards = numberOfPairsOfCards
        
        if defaultPairsOfCards > emojis.count {
            defaultPairsOfCards = emojis.count
        }
        
        return Theme(name: name, emojis: emojis, numberOfPairsOfCards: defaultPairsOfCards, color: color)
    }
    
    
    init() {
        // Choose a random theme when the game starts
        currentTheme = EmojiMemoryGame.chooseRandomTheme()
        chosenColor = EmojiMemoryGame.getColor(currentTheme.color)
        model = EmojiMemoryGame.createMemoryGame(with: currentTheme)
    }
    
    // A static func that just creates a MemoryGame<String> object
    static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
        var numberOfPairsOfCards = theme.numberOfPairsOfCards
        var emojis = theme.emojis
        
        if theme.name == "Vehicles" || theme.name == "Flags" {
            numberOfPairsOfCards = 12
            emojis = emojis.shuffled()
            // print("Emojis: \(emojis)")
        }
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { pairIndex in emojis[pairIndex] }
    }
    
    var points: Int {
        return model.points
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    static func chooseRandomTheme() -> Theme {
        allThemes.randomElement()!
    }
    
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func startNewGame() {
        currentTheme = EmojiMemoryGame.chooseRandomTheme()
        chosenColor = EmojiMemoryGame.getColor(currentTheme.color)
        model = EmojiMemoryGame.createMemoryGame(with: currentTheme)
    }
}
