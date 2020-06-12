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
    var numberOfFigures: NumberOfFigures
    var shape: FigureShape
    var color: FigureColor
    var shading: FigureShading
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
                        numberOfFigures: numberOfFigures,
                        shape: shape,
                        color: color,
                        shading: shading)
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
        Group {
            CardView(
                numberOfFigures: .two,
                shape: .squiggle,
                color: .green,
                shading: .striped,
                isFaceUp: true
            )
            CardView(
                numberOfFigures: .two,
                shape: .squiggle,
                color: .green,
                shading: .striped,
                isFaceUp: false
            )
            CardView(
                numberOfFigures: .one,
                shape: .oval,
                color: .purple,
                shading: .solid,
                isFaceUp: true
            )
                .frame(width: 200, height: 250, alignment: .center)
            CardView(
                numberOfFigures: .two,
                shape: .squiggle,
                color: .green,
                shading: .striped,
                isFaceUp: false
            )
                .frame(width: 200, height: 250, alignment: .center)
            CardView(
                numberOfFigures: .three,
                shape: .diamond,
                color: .red,
                shading: .open,
                isFaceUp: true
            )
                .frame(width: 100, height: 130, alignment: .center)
            CardView(
                numberOfFigures: .two,
                shape: .squiggle,
                color: .green,
                shading: .striped,
                isFaceUp: false
            )
                .frame(width: 100, height: 130, alignment: .center)
        }
    }
}



enum NumberOfFigures: Int {
    case one = 1
    case two
    case three
}

enum FigureShape {
    case diamond
    case squiggle
    case oval
}

enum FigureColor {
    case red
    case green
    case purple
}

enum FigureShading {
    case open
    case solid
    case striped
}
