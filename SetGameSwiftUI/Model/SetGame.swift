//
//  SetGame.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 06/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import Foundation

struct SetGame<Card> where Card: SetCard {
    private(set) var deck: Array<Card>
    private(set) var discardPile: Array<Card>
    private(set) var playingCards: Array<Card>
    private let initialNumberOfPlayingCards = 12
    private let cardsPerSet = 3
    private var selectedCards: Array<Card> {
        playingCards.filter{ $0.isSelected }
    }
    
    init(cards: [Card]) {
        deck = cards.map{ $0.facingDown.unselected }//.shuffled()
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
        if selectedCards.count < cardsPerSet {
            for index in playingCards.indices {
                if playingCards[index] == card {
                    playingCards[index].isSelected = !playingCards[index].isSelected
                }
            }
        }
        isThereASet()
    }
    
    private mutating func isThereASet() {
        guard selectedCards.count == cardsPerSet else {
            return
        }
        
        if Card.isASet(card1: selectedCards[0], card2: selectedCards[1], card3: selectedCards[2]) {
            discardSelectedCards()
        } else {
            unselectCards()
        }
    }
    
    private mutating func discardSelectedCards() {
        for _ in selectedCards.indices {
            discardPile.append(playingCards.remove(at: playingCards.firstIndex(of: selectedCards.first!)!).unselected)
        }
    }
    
    private mutating func unselectCards() {
        for index in playingCards.indices {
            if selectedCards.contains(playingCards[index]) {
                playingCards[index].isSelected = false
            }
        }
    }
}
