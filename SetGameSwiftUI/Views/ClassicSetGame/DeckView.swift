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
    
    var deck: [ClassicCard]
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    // MARK: Functions
    
    func body(for size: CGSize) -> some View {
        ZStack {
            ForEach(deck) { card in
                ClassicCardView(card: card).rotationEffect(self.randomAngle(for: size))
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
        DeckView(deck: CardSetGame(cards: ClassicCard.generateAll()).deck)
    }
}
