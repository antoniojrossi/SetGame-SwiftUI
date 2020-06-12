//
//  FigureShadingModifier.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 12/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import SwiftUI

struct FigureShadingModifier: ViewModifier {
    var shading: FigureShading
    var stripeWidth = 0
    func body(content: Content) -> some View {
        Group {
            if shading == .open {
                Color.clear.mask(content)
            }
            if shading == .solid {
                content
            }
            if shading == .striped {
                StripedPattern(stripeWidth: stripeWidth).mask(content)
            }
                
        }
    }
}

extension View {
    func shading(to figureShading: FigureShading, stripeWidth: Int = 0) -> some View {
        self.modifier(FigureShadingModifier(shading: figureShading, stripeWidth: stripeWidth))
    }
}
