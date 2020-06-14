//
//  FigureShape.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 12/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import SwiftUI

struct FigureShapeView: Shape {
    
    var shape: ClassicPlayFigure.Shape
    
    func path(in rect: CGRect) -> Path {
        switch shape {
        case .diamond:
            return Diamond().path(in: rect)
        case .squiggle:
            return Squiggle().path(in: rect)
        case .oval:
            return Oval().path(in: rect)
        }
    }
}
