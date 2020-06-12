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
    var numberOfFigures: NumberOfFigures
    var shape: FigureShape
    var color: FigureColor
    var shading: FigureShading
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    // MARK: Functions
    
    func body(for size: CGSize) -> some View {
        VStack {
            Spacer()
            ForEach(0..<self.numberOfFigures.rawValue) {_ in
                FigureView(shape: self.shape, color: self.color, shading: self.shading)
                    .padding(self.padding(for: size))
                    .frame(height: self.height(for: size))
                    .aspectRatio(self.aspectRatio, contentMode: .fit)
            }
            Spacer()
        }
    }
    
    // MARK: Drawing Constants
    
    func padding(for size: CGSize) -> CGFloat {
        size.height / 50
    }
    func height(for size: CGSize) -> CGFloat {
        size.height / 4
    }
    var aspectRatio: CGFloat = 4/2
}

struct CardFrontView_Previews: PreviewProvider {
    static var previews: some View {
        CardFrontView(numberOfFigures: .one, shape: .squiggle, color: .purple, shading: .striped)
    }
}
