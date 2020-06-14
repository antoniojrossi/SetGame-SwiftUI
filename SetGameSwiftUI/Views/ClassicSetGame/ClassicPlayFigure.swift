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
    }
    
    enum Shape: CaseIterable {
        case diamond
        case squiggle
        case oval
    }
    
    enum Shading: CaseIterable {
        case open
        case solid
        case striped
    }
    
    enum Color: CaseIterable {
        case red
        case green
        case purple
    }
    
    private(set) var numberOfFigures: NumberOfFigures
    private(set) var shape: Shape
    private(set) var color: Color
    private(set) var shading: Shading

    var description: String {
        "\(numberOfFigures) \(color) \(shading) \(shape)"
    }
    
    func match(with figure1: PlayFigure, and figure2: PlayFigure) -> Bool {
        return true
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
