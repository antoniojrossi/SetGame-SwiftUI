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
    private(set) var playingCards: Array<Card>
    private let initialNumberOfPlayingCards = 12
    
    init(playFigures: Array<PlayFigure>) {
        deck = playFigures.map { Card(isFaceUp: false, figure: $0) }.shuffled()
        discardPile = []
        playingCards = []
        dealCards(initialNumberOfPlayingCards)
    }
    
    mutating func dealCards(_ numberOfCards: Int = 3) {
        var newPlayingCards = deck.prefix(numberOfCards)
        for index in newPlayingCards.indices {
            newPlayingCards[index].isFaceUp = true
        }
        playingCards.append(contentsOf: newPlayingCards)
        deck = Array(deck.dropFirst(numberOfCards))
    }
}
