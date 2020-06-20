//
//  CardSetGameView.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 06/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import Foundation

class CardSetGame: ObservableObject {
    @Published private var game: SetGame<ClassicCard>
    
    init(cards: [ClassicCard]){
        game = SetGame(cards: cards)
    }
    
    // MARK: Access to the model
    var deck: [ClassicCard] {
        game.deck
    }
    var discardPile: [ClassicCard] {
        game.discardPile
    }
    var playingCards: [ClassicCard] {
        game.playingCards
    }
    
    // MARK: Intents
    
    func dealCards() {
        game.dealCards()
    }
    
    func choose(card: ClassicCard) {
        game.choose(card)
    }
}
