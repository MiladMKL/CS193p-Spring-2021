//
//  ContentView.swift
//  Memorize_Assignment1
//
//  Created by Milad on 17.02.22.
//

import SwiftUI

struct ContentView: View {
    let vehiclesEmojis = ["✈️", "🚗", "🚀", "🚜", "🚲", "🛵", "🛺", "🚂", "🛴", "🚑", "🚒", "🚓", "🏎", "🚤", "🚁", "🛸", "⛵️", "🚐"]
    
    let flagsEmojis = ["🇦🇫", "🇦🇱", "🇧🇷", "🇩🇪", "🇫🇷", "🇯🇵", "🇯🇲", "🇺🇸", "🇦🇹", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇬🇷", "🇻🇪"]
    let sportsEmojis = ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏏", "⛳️", "🥌", "🏑"]
    
    @State var emojis: [String]
    
    init() {
        emojis = vehiclesEmojis
    }
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.title)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojis.count], id:\.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                vehiclesTheme
                Spacer()
                flagsTheme
                Spacer()
                sportsTheme
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var vehiclesTheme: some View {
        Button {
            emojis = vehiclesEmojis.shuffled()
        } label: {
            VStack {
                Image(systemName: "car")
                Text("Vehicles").font(.subheadline)
            }
        }
    }
    
    var flagsTheme: some View {
        Button {
            emojis = flagsEmojis.shuffled()
        } label: {
            VStack {
                Image(systemName: "flag.fill")
                Text("Flags").font(.subheadline)
            }
        }
    }
    
    var sportsTheme: some View {
        Button {
            emojis = sportsEmojis.shuffled()
        } label: {
            VStack {
                Image(systemName: "sportscourt.fill")
                Text("Sports").font(.subheadline)
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
