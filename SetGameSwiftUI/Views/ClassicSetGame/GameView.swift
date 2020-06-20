//
//  ContentView.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 06/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import SwiftUI

struct GameView: View {
    
    // MARK: Model
    @ObservedObject var game: CardSetGame
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        VStack {
            Spacer()
            Grid(game.playingCards) { card in
                CardView(
                    playFigure: card.figure as! ClassicPlayFigure,
                    isFaceUp: card.isFaceUp,
                    isSelected: card.isSelected)
                        .padding(self.padding(for: size))
                        .onTapGesture {
                            self.game.choose(card: card)
                        }
            }.animation(.easeInOut)
            Divider()
            DeckView(deck: game.deck)
                .padding(5)
                .frame(width: size.width, height: size.height / 6, alignment: .leading)
                .onTapGesture {
                    self.game.dealCards()
            }.animation(.easeInOut)
        }
    }
    
    func padding(for size: CGSize) -> CGFloat {
        size.width / 100
    }
}

struct CardSetGameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(game: CardSetGame(playFigures: ClassicPlayFigure.all()))
    }
}
