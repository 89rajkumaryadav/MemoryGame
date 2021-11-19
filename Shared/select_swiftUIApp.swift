//
//  select_swiftUIApp.swift
//  Shared
//
//  Created by Rajkumar Yadav on 05/11/21.
//

import SwiftUI

@main
struct select_swiftUIApp: App {
    
   private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(memoryGameViewModel: game)
        }
    }
}
