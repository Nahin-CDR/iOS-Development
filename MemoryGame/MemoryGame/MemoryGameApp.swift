//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by Nazmul Haque Nahin on 16/5/24.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
