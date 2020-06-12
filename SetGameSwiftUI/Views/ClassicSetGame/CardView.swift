//
//  CardView.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 07/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import SwiftUI

struct CardView<BackContent>: View where BackContent: View{
    
    // MARK: Properties
    var numberOfFigures: NumberOfFigures
    var shape: FigureShape
    var color: FigureColor
    var shading: FigureShading
    var isFaceUp = true
    var backView: BackContent
    
    var body: some View {
        GeometryReader { geometry  in
            self.body(for: geometry.size);
        }
    }
    
    // MARK: Functions
    
    func body(for size: CGSize) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: cornerRadius(for: size))
            .fill(isFaceUp ? faceUpBackgroundColor : faceDownBackgroundColor)
            .shadow(radius: shadowCornerRadius(for: size),
                    x: shadowOffset(for: size),
                    y: shadowOffset(for: size))
            Group {
                if isFaceUp {
                    VStack {
                        Spacer()
                        ForEach(0..<self.numberOfFigures.rawValue) {_ in
                            ZStack {
                                FigureShapeView(shape: self.shape)
                                    .shading(to: self.shading, stripeWidth: self.shadingLineWidth(for: size))
                                    .colored(to: self.color)
                                FigureShapeView(shape: self.shape)
                                    .stroke(lineWidth: self.borderLineWidth(for: size))
                                    .colored(to: self.color)
                            }
                            .padding(self.padding(for: size))
                            .frame(height: self.height(for: size))
                            .aspectRatio(self.aspectRatio, contentMode: .fit)
                        }
                        Spacer()
                    }
                } else {
                    backView
                }
            }
        }
        .aspectRatio(cardAspectRatio, contentMode: .fit)
    }
    
    // MARK: Drawing constants
    func borderLineWidth(for size: CGSize) -> CGFloat {
        size.width / 100
    }
    func shadingLineWidth(for size: CGSize) -> Int {
        Int(size.width) / 100
    }
    func padding(for size: CGSize) -> CGFloat {
        size.height / 50
    }
    func height(for size: CGSize) -> CGFloat {
        size.height / 4
    }
    var aspectRatio: CGFloat = 4/2
    var cardAspectRatio: CGFloat = 2/3
    private let faceUpBackgroundColor = Color.white
    private let faceDownBackgroundColor = Color(red: 0.694, green: 0.612, blue: 0.851)
    private func cornerRadius(for size: CGSize) -> CGFloat {
        size.width / 80
    }
    private func shadowCornerRadius(for size: CGSize) -> CGFloat {
        size.width / 80
    }
    private func shadowOffset(for size: CGSize) -> CGFloat {
        size.width / 100
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardView(
                numberOfFigures: .two,
                shape: .squiggle,
                color: .green,
                shading: .striped,
                isFaceUp: true,
                backView: CardBackView()
            )
            CardView(
                numberOfFigures: .two,
                shape: .squiggle,
                color: .green,
                shading: .striped,
                isFaceUp: true,
                backView: CardBackView()
            )
                .frame(width: 200, height: 250, alignment: .center)
            CardView(
                numberOfFigures: .two,
                shape: .squiggle,
                color: .green,
                shading: .striped,
                isFaceUp: true,
                backView: CardBackView()
            ).frame(width: 100, height: 130, alignment: .center)
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
