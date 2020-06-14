//
//  ContentView.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 06/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import SwiftUI

struct GameView: View {
    
    // MARK: Model
    @ObservedObject var game: CardSetGame
    
    var body: some View {
        DeckView(deck: game.deck)
    }
}

struct CardSetGameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(game: CardSetGame(playFigures: ClassicPlayFigure.all()))
    }
}
