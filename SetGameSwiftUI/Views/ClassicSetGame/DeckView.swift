//
//  Deck.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 14/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import SwiftUI

struct DeckView: View {
    
    // MARK: Properties
    
    var deck: [Card]
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    // MARK: Functions
    
    func body(for size: CGSize) -> some View {
        ZStack {
            ForEach(deck) { card in
                CardView(
                    playFigure: card.figure as! ClassicPlayFigure,
                    isFaceUp: card.isFaceUp
                )
                .rotationEffect(self.randomAngle(for: size))
            }
        }
    }
    
    
    // MARK: Drawing constants
    
    func randomAngle(for size: CGSize) -> Angle {
        Angle.init(radians: Double.random(in: 0...0.035))
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView(deck: CardSetGame(playFigures: ClassicPlayFigure.all()).deck)
    }
}
