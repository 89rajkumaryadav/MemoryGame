//
//  MemoryGame.swift
//  select_swiftUI (iOS)
//
//  Created by Rajkumar Yadav on 08/11/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard:Int? {
        get{ cards.indices.filter{cards[$0].isFaceUp }.oneAndOnly }
        
        set{ cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) }}
       
        
    }
    
    mutating func choose(_ card:Card){
        
       // let choosenIndex = index(of: card)
    //var choosenCard = cards[choosenIndex];
       // choosenCard.isFaceUp = true;
       
        if let choosenIndex = cards.firstIndex(where: {$0.id == card.id }),
           !cards[choosenIndex].isFaceUp,
           !cards[choosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                if cards[choosenIndex].content == cards[potentialMatchIndex].content{
                    cards[choosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                
                cards[choosenIndex].isFaceUp = true
                
            }else{
               
                indexOfTheOneAndOnlyFaceUpCard = choosenIndex
            }
            
       
        }
    }
    
  /*  func index(of card:Card)-> Int{
        
        for index in 0..<cards.count{
            
            if cards[index].id == card.id{
                return index
            }
        }
        
        return 0
    }
        */
    
    init(numberOfPairsOfCard: Int, createCardContent: (Int)->CardContent){
        cards = Array<Card>()
        
        //add number of pairs of cards x2 cards to cards array
        
        for pairIndex in 0..<numberOfPairsOfCard {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content,id: pairIndex*2))
            cards.append(Card(content: content,id: pairIndex*2+1))
        }
        
    }
    
    struct Card: Identifiable{
        var isFaceUp: Bool = true;
        var isMatched: Bool = false;
        let content:CardContent
        let id:Int
    }
    
}


extension Array{
    
    var oneAndOnly: Element?{
        
        if count == 1{
            return first
        }else{
            return nil
        }
        
    }
}
