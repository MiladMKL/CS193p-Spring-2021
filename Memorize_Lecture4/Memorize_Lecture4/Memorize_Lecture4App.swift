//
//  Memorize_Lecture4App.swift
//  Memorize_Lecture4
//
//  Created by Milad on 17.02.22.
//

import SwiftUI

@main
struct Memorize_Lecture4App: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
