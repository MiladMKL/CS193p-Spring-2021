//
//  ContentView.swift
//  Memorize_Lecture1
//
//  Created by Milad on 17.02.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius:25.0)
                .stroke(lineWidth: 3)
            Text("Hello, world!")
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
