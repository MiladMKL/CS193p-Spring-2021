//
//  Memorize_Assignment2App.swift
//  Memorize_Assignment2
//
//  Created by Milad on 20.02.22.
//

import SwiftUI

@main
struct Memorize_Assignment2App: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
