//
//  CardSetGameView.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 06/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import Foundation

class CardSetGame: ObservableObject {
    @Published private var game: SetGame = SetGame()
    
    // MARK: - Access to the model
    var name: String {
        game.name
    }
}
