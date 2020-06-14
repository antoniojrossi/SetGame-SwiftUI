//
//  Deck.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 14/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import SwiftUI

struct DeckView: View {
    var deck: [Card]
    var body: some View {
        ZStack {
            ForEach(deck) { card in
                CardView(
                    playFigure: card.figure as! ClassicPlayFigure,
                    isFaceUp: card.isFaceUp
                )
                    .offset(x: CGFloat.random(in: 0...10), y: CGFloat.random(in: 0...10))
                    .rotationEffect(Angle.init(radians: Double.random(in: 0...0.035)))
            }
        }
    }
}
