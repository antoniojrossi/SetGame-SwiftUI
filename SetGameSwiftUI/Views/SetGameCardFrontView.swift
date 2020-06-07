//
//  FrontCardView.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 07/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import SwiftUI

struct SetGameCardFrontView: View {
    
    // MARK: Properties
    
    var card = ClassicSetCard(number: .one, shape: .diamond, color: .red, shading: .open)
    var body: some View {
        VStack {
//            ForEach(0..<card.number.rawValue) {_ in
//              Diamond().foregroundColor(Color.green)
//            }
            
            Diamond().foregroundColor(Color.green)
            Capsule().stroke(Color.red, lineWidth: 5)
            Squiggle().mask(StripedPattern(numberOfStripes: 50)).overlay(Squiggle().stroke(Color.purple, lineWidth: 5)).foregroundColor(Color.purple)
        }
    }
}

struct FrontCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SetGameCardFrontView(
                card: ClassicSetCard(number: .one, shape: .diamond, color: .red, shading: .solid)
            )
            SetGameCardFrontView(
                card: ClassicSetCard(number: .two, shape: .oval, color: .green, shading: .open)
            )
            SetGameCardFrontView(
                card: ClassicSetCard(number: .three, shape: .squiggle, color: .purple, shading: .striped)
            )
        }
    }
}

struct ClassicSetCard {
    enum Number: Int {
        case one = 1
        case two
        case three
    }

    enum Shape {
        case diamond
        case squiggle
        case oval
    }

    enum Color {
        case red
        case green
        case purple
    }

    enum Shading {
        case open
        case solid
        case striped
    }
    
    private(set) var number: Number
    private(set) var shape: Shape
    private(set) var color: Color
    private(set) var shading: Shading
}
