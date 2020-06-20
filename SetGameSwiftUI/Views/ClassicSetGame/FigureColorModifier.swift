//
//  FigureColorModifier.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 12/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import SwiftUI

struct FigureColorModifier: ViewModifier {
    
    var figureColor: ClassicCard.Color
    
    func body(content: Content) -> some View {
        Group {
            if figureColor == .green {
                content.foregroundColor(Color.green)
            }
            if figureColor == .purple {
                content.foregroundColor(Color.purple)
            }
            if figureColor == .red {
                content.foregroundColor(Color.red)
            }
        }
    }
}

extension View {
    func colored(to figureColor: ClassicCard.Color) -> some View {
        self.modifier(FigureColorModifier(figureColor: figureColor))
    }
}

