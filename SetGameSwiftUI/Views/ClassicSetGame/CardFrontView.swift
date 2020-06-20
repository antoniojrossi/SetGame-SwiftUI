//
//  CardFrontView.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 12/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import SwiftUI

struct CardFrontView: View {
    
    // MARK: Properties
    var numberOfFigures: ClassicCard.NumberOfFigures
    var shape: ClassicCard.Shape
    var color: ClassicCard.Color
    var shading: ClassicCard.Shading
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    // MARK: Functions
    
    func body(for size: CGSize) -> some View {
        VStack {
            Spacer(minLength: 1)
            ForEach(0..<self.numberOfFigures.rawValue) {_ in
                FigureView(shape: self.shape, color: self.color, shading: self.shading)
                    .frame(height: self.height(for: size))
                    .aspectRatio(4/2, contentMode: .fit)
            }
            Spacer(minLength: 1)
        }
    }
    
    // MARK: Drawing Constants
    func height(for size: CGSize) -> CGFloat {
        size.height / 4
    }
}

struct CardFrontView_Previews: PreviewProvider {
    static var previews: some View {
        CardFrontView(numberOfFigures: .three, shape: .squiggle, color: .purple, shading: .striped)
    }
}
