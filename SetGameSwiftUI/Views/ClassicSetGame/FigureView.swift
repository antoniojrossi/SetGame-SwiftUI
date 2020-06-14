//
//  FigureView.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 12/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import SwiftUI

struct FigureView: View {
    
    // MARK: Properties
    
    var shape: ClassicPlayFigure.Shape
    var color: ClassicPlayFigure.Color
    var shading: ClassicPlayFigure.Shading
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    // MARK: Functions
    
    func body(for size: CGSize) -> some View {
        ZStack {
            FigureShapeView(shape: self.shape)
                .shading(to: self.shading, stripeWidth: self.shadingLineWidth(for: size))
                .colored(to: self.color)
            FigureShapeView(shape: self.shape)
                .stroke(lineWidth: self.borderLineWidth(for: size))
                .colored(to: self.color)
        }
    }
    
    // MARK: Drawing Constants
    
    func borderLineWidth(for size: CGSize) -> CGFloat {
        max(1, size.width / 50)
    }
    func shadingLineWidth(for size: CGSize) -> Int {
        max(1, Int(size.width) / 25)
    }
}

struct FigureView_Previews: PreviewProvider {
    static var previews: some View {
        FigureView(shape: .squiggle, color: .green, shading: .open)
    }
}
