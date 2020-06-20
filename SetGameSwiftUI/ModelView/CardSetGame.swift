//
//  CardSetGameView.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 06/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import Foundation

class CardSetGame: ObservableObject {
    @Published private var game: SetGame
    
    init(playFigures: Array<PlayFigure> ){
        game = SetGame(playFigures: playFigures)
    }
    
    // MARK: Access to the model
    var deck: [Card] {
        game.deck
    }
    var discardPile: [Card] {
        game.discardPile
    }
    var playingCards: [Card] {
        game.playingCards
    }
    
    // MARK: Intents
    
    func dealCards() {
        game.dealCards()
    }
    
    func choose(card: Card) {
        game.choose(card)
    }
}
