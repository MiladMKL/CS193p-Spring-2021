//
//  ContentView.swift
//  Memorize_Assignment2
//
//  Created by Milad on 20.02.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.currentTheme.name)
                    .font(.title)
                Spacer()
                Text("Points: \(viewModel.points)")
                    .font(.title2)
            }
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(viewModel.chosenColor)
            Spacer()
            HStack {
                newGame
            }
        }
        .padding(.horizontal)
    }
    
    var newGame: some View {
        Button {
            viewModel.startNewGame()
        } label: {
            VStack {
                Image(systemName: "gobackward")
                Text("New Game").font(.headline)
            }
        }
    }
}



struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            }
            else {
                shape.fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        ContentView(viewModel: game).preferredColorScheme(.light)
        ContentView(viewModel: game).preferredColorScheme(.dark)
    }
}
