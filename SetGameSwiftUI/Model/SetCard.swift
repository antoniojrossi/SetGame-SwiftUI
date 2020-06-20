//
//  SetCard.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 20/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import Foundation

protocol SetCard: Identifiable, Equatable where Feature1: SetFeatureCategory & Equatable,
                                                Feature2: SetFeatureCategory & Equatable,
                                                Feature3: SetFeatureCategory & Equatable,
                                                Feature4: SetFeatureCategory & Equatable {
    associatedtype Feature1
    associatedtype Feature2
    associatedtype Feature3
    associatedtype Feature4
    
    var feature1: Feature1 { get }
    var feature2: Feature2 { get }
    var feature3: Feature3 { get }
    var feature4: Feature4 { get }
    
    var isFaceUp: Bool { get set }
    var isSelected: Bool { get set }
    
    static func generateAll() -> [Self]
}

extension SetCard {
    var facingDown: Self {
        var card = self
        card.isFaceUp = false
        return card
    }
    
    var unselected: Self {
        var card = self
        card.isSelected = false
        return card
    }
}

extension SetCard where Feature1: Equatable, Feature2: Equatable, Feature3: Equatable, Feature4: Equatable {
    static func isASet(card1: Self, card2: Self, card3: Self) -> Bool {
        let partialSets = [
            Feature1.isASet(content1: card1.feature1, content2: card2.feature1, content3: card3.feature1),
            Feature2.isASet(content1: card1.feature2, content2: card2.feature2, content3: card3.feature2),
            Feature3.isASet(content1: card1.feature3, content2: card2.feature3, content3: card3.feature3),
            Feature4.isASet(content1: card1.feature4, content2: card2.feature4, content3: card3.feature4)
        ]
        return partialSets.reduce(true){ $0 && $1 }
    }
}
