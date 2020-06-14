//
//  CardView.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 07/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    // MARK: Properties
    var playFigure: ClassicPlayFigure
    var isFaceUp = true
    
    var body: some View {
        GeometryReader { geometry  in
            self.body(for: geometry.size);
        }
    }
    
    // MARK: Functions
    
    func body(for size: CGSize) -> some View {
        ZStack{
            CardBackground(isFaceUp: isFaceUp)
            Group {
                if isFaceUp {
                    CardFrontView(
                        numberOfFigures: playFigure.numberOfFigures,
                        shape: playFigure.shape,
                        color: playFigure.color,
                        shading: playFigure.shading)
                } else {
                    CardBackView()
                }
            }
        }
        .aspectRatio(cardAspectRatio, contentMode: .fit)
    }
    
    // MARK: Drawing constants
    var cardAspectRatio: CGFloat = 2/3
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            playFigure: ClassicPlayFigure(
                numberOfFigures: .two,
                shape: .diamond,
                color: .green,
                shading: .striped),
            isFaceUp: true
        )
    }
}
