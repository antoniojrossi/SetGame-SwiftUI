//
//  Card.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 14/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import Foundation

struct Card: Identifiable, CustomStringConvertible{
    // MARK: Properties
    let id = UUID()
    var isFaceUp = false
    let figure: PlayFigure
    
    var description: String {
        "\(figure) \(isFaceUp ? "faced up" : "faced down")"
    }
}
