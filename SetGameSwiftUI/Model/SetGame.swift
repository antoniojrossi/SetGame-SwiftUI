//
//  SetGame.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 06/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import Foundation

struct SetGame {
    var name: String = "Hola caracola"
    private(set) var deck = [SetGameCard]()
    private(set) var discardPile = [SetGameCard]()
}

protocol SetGameCard {
    var feature1: SetGameCardFeature { get }
    var feature2: SetGameCardFeature { get }
    var feature3: SetGameCardFeature { get }
    var feature4: SetGameCardFeature { get }
}

protocol SetGameCardFeature {
    var value: String { get }
}
