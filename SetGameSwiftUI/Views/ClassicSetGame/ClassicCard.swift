//
//  ClassicCard.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 20/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import Foundation

struct ClassicCard: SetCard, CustomStringConvertible {
    typealias Feature1 = NumberOfFigures
    typealias Feature2 = Shape
    typealias Feature3 = Shading
    typealias Feature4 = Color
    
    enum NumberOfFigures: Int, CaseIterable, SetFeatureCategory {
        typealias Content = Self
        
        case one = 1
        case two
        case three
    }
    
    enum Shape: CaseIterable, SetFeatureCategory {
        typealias Content = Self

        case diamond
        case squiggle
        case oval
    }
    
    enum Shading: CaseIterable, SetFeatureCategory {
        typealias Content = Self

        case open
        case solid
        case striped
    }
    
    enum Color: CaseIterable, SetFeatureCategory {
        typealias Content = Self

        case red
        case green
        case purple
    }
    
    var id = UUID()
    var feature1: NumberOfFigures { numberOfFigures }
    var feature2: Shape { shape }
    var feature3: Shading { shading }
    var feature4: Color { color }
    
    var numberOfFigures: NumberOfFigures
    var shape: Shape
    var shading: Shading
    var color: Color
    
    var isFaceUp = false
    var isSelected = false
    
    var description: String {
        let facedUp = isFaceUp ? "faced Up" : "faced down"
        let selected = isSelected ? "selected" : "not selected"
        return "\(numberOfFigures) \(color) \(shading) \(shape) \(facedUp) \(selected)"
    }
    
    public static func generateAll() -> [Self] {
        var res = [Self]()
        for numberOfFigure in NumberOfFigures.allCases {
            for color in Color.allCases {
                for shading in Shading.allCases {
                    for shape in Shape.allCases {
                        res.append(Self.init(numberOfFigures: numberOfFigure, shape: shape, shading: shading, color: color))
                    }
                }
            }
        }
        return res
    }
}
