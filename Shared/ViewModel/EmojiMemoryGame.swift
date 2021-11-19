//
//  EmojiMemoryGame.swift
//  select_swiftUI (iOS)
//
//  Created by Rajkumar Yadav on 08/11/21.
//

import Foundation



class EmojiMemoryGame:ObservableObject{
    typealias Card = MemoryGame<String>.Card
   private static let  emojies = ["🚘","🚠","🚉","🚀","🚇","🍏","🍋","🫐","🥑","🫒","⛪️"];//11
    
   private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCard: 11, createCardContent: {index in emojies[index]})
    }
   
   @Published private var model: MemoryGame<String> = createMemoryGame()
    
   public var cards: Array<Card>{
        return model.cards
    }
    
    
    // MARK:- Users intent
    func chooseCard(_ card:Card){
     
        model.choose(card)
    }
    
}
























