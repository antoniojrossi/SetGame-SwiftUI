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
    
    var body: some View {
        GeometryReader { geometry  in
            self.body(for: geometry.size);
        }
    }
    
    // MARK: Functions
    
    func body(for size: CGSize) -> some View {
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
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardView(numberOfFigures: .two, shape: .squiggle, color: .green, shading: .striped)
            CardView(numberOfFigures: .one, shape: .diamond, color: .red, shading: .striped).frame(width: 100, height: 130, alignment: .center)
            CardView(numberOfFigures: .one, shape: .diamond, color: .red, shading: .striped).frame(width: 200, height: 250, alignment: .center)
            CardView(numberOfFigures: .one, shape: .diamond, color: .red, shading: .striped)
            CardView(numberOfFigures: .one, shape: .diamond, color: .red, shading: .striped).frame(width: 100, height: 130, alignment: .center)
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
