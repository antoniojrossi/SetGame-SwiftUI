//
//  ClassicCardView.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 20/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import SwiftUI

struct ClassicCardView: View {
    
    // MARK: Properties
    var card: ClassicCard
    
    var body: some View {
        GeometryReader { geometry  in
            self.body(for: geometry.size);
        }
    }
    
    // MARK: Functions
    
    func body(for size: CGSize) -> some View {
        ZStack{
            CardBackground(isFaceUp: card.isFaceUp, isSelected: card.isSelected)
            Group {
                if card.isFaceUp {
                    CardFrontView(
                        numberOfFigures: card.numberOfFigures,
                        shape: card.shape,
                        color: card.color,
                        shading: card.shading
                    )
                    .padding([.top, .bottom], self.padding(for: size))
                } else {
                    CardBackView()
                }
            }
        }
        .aspectRatio(cardAspectRatio, contentMode: .fit)
        .scaleEffect(card.isSelected ? 1.020 : 1)
    }
    
    // MARK: Drawing constants
    var cardAspectRatio: CGFloat = 2/3
    func padding(for size: CGSize) -> CGFloat {
        return size.height / 10
    }
    
}

struct ClassicCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ClassicCardView(card: ClassicCard(
                numberOfFigures: .three,
                shape: .squiggle,
                shading: .striped,
                color: .green,
                isFaceUp: true)
            )
            ClassicCardView(card: ClassicCard(
                numberOfFigures: .one,
                shape: .diamond,
                shading: .open,
                color: .green,
                isFaceUp: false)
            )
            ClassicCardView(card: ClassicCard(
                numberOfFigures: .one,
                shape: .diamond,
                shading: .open,
                color: .green,
                isFaceUp: true,
                isSelected: true)
            )
        }
    }
}
