//
//  ContentView.swift
//  Shared
//
//  Created by Rajkumar Yadav on 05/11/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var memoryGameViewModel:EmojiMemoryGame
    
    
    var body: some View {
       
     //  AspectVGrid(items: <#T##[_]#>, aspectRatio: <#T##CGFloat#>, content: T##(_) -> _)
        
        AspectVGrid(items: memoryGameViewModel.cards, aspectRatio: 2/3,content: { card in
          
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            }else{
                CardView(card:card)
            }
            
        })
            
          /*  ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]){
                ForEach(memoryGameViewModel.cards){ card in
                CardView(content: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            memoryGameViewModel.chooseCard(card)
                        }
                
            }
            }.padding()
            }*/
            
       
        
    }
    
   
    
}


struct CardView: View{
   
    var content:MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if content.isFaceUp {
                
                    shape.fill().foregroundColor(.white)
                    shape.stroke(lineWidth: DrawingConstants.lineWidth)
                    
                    Text(content.content).font(font(in: geometry.size))
                    
                    
               
                }else if(content.isMatched){
                    shape.opacity(0)
                } else{
                shape.fill().foregroundColor(.red)
                shape.stroke(lineWidth: 3)
            }
                
            }.foregroundColor(.red)
        }
        
            
    }
    
    
    private func font(in size:CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale )
    }
    
    private struct DrawingConstants{
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        EmojiMemoryGameView(memoryGameViewModel: EmojiMemoryGame())
    }
}








