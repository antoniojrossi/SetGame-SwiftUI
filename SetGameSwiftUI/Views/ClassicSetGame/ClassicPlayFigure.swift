//
//  ClassicPlayFigure.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 14/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import Foundation

struct ClassicPlayFigure: PlayFigure, CustomStringConvertible {
    
    enum NumberOfFigures: Int, CaseIterable {
        case one = 1
        case two
        case three
        
        func isASet(with number1: NumberOfFigures, and number2: NumberOfFigures) -> Bool {
            (self == number1 && self == number2) || (self != number1 && self != number2 && number1 != number2)
        }
    }
    
    enum Shape: CaseIterable {
        case diamond
        case squiggle
        case oval
        
        func isASet(with shape1: Shape, and shape2: Shape) -> Bool {
            (self == shape1 && self == shape2) || (self != shape1 && self != shape2 && shape1 != shape2)
        }
    }
    
    enum Shading: CaseIterable {
        case open
        case solid
        case striped
        
        func isASet(with shading1: Shading, and shading2: Shading) -> Bool {
            (self == shading1 && self == shading2) || (self != shading1 && self != shading2 && shading1 != shading2)
        }
    }
    
    enum Color: CaseIterable {
        case red
        case green
        case purple
        
        func isASet(with color1: Color, and color2: Color) -> Bool {
            (self == color1 && self == color2) || (self != color1 && self != color2 && color1 != color2)
        }
    }
    
    private(set) var numberOfFigures: NumberOfFigures
    private(set) var shape: Shape
    private(set) var color: Color
    private(set) var shading: Shading

    var description: String {
        "\(numberOfFigures) \(color) \(shading) \(shape)"
    }
    
    func match(with figure1: PlayFigure, and figure2: PlayFigure) -> Bool {
        let classicFigure1 = figure1 as! ClassicPlayFigure
        let classicFigure2 = figure2 as! ClassicPlayFigure
        
        let sets: Array<Bool> = [numberOfFigures.isASet(with: classicFigure1.numberOfFigures, and: classicFigure2.numberOfFigures),
                                 shape.isASet(with: classicFigure1.shape, and: classicFigure2.shape),
                                 shading.isASet(with: classicFigure1.shading, and: classicFigure2.shading),
                                 color.isASet(with: classicFigure1.color, and: classicFigure2.color)]
        return sets.reduce(true){ $0 && $1 }
    }
    
    public static func all() -> [PlayFigure] {
        var res = [Self]()
        for numberOfFigure in NumberOfFigures.allCases {
            for color in Color.allCases {
                for shading in Shading.allCases {
                    for shape in Shape.allCases {
                        res.append(Self.init(numberOfFigures: numberOfFigure, shape: shape, color: color, shading: shading))
                    }
                }
            }
        }
        return res
    }
}
