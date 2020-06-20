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
    private var selectedCards: Array<Card> {
        playingCards.filter{ $0.isSelected }
    }
    
    init(playFigures: Array<PlayFigure>) {
        deck = playFigures.map { Card(isFaceUp: false, isSelected: false, figure: $0) }.shuffled()
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
    
    mutating func choose(_ card: Card) {
        if selectedCards.count < 3 {
            for index in playingCards.indices {
                if playingCards[index] == card {
                    playingCards[index].isSelected = !playingCards[index].isSelected
                }
            }
        }
        if selectedCards.count == 3 {
            if selectedCards[0].figure.match(with: selectedCards[1].figure, and: selectedCards[2].figure) {
                for _ in 0...2 {
                    discardPile.append(playingCards.remove(at: playingCards.firstIndex(of: selectedCards[0])!))
                }
            } else {
                for index in playingCards.indices {
                    if selectedCards.contains(playingCards[index]) {
                        playingCards[index].isSelected = false
                    }
                }
            }
        }
    }
}
