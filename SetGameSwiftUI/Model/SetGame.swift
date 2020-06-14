//
//  SetGame.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 06/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import Foundation

struct SetGame {
    private(set) var deck: Array<Card>
    private(set) var discardPile: Array<Card>
    
    init(playFigures: Array<PlayFigure>) {
        deck = playFigures.map { Card(isFaceUp: false, figure: $0) }
        discardPile = []
    }
}
