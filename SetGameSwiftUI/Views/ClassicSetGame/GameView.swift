//
//  ContentView.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 06/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import SwiftUI

struct GameView: View {
    
    // MARK: Properties

    @ObservedObject var game: CardSetGame
    var body: some View {
        CardView(
            numberOfFigures: .three,
            shape: .squiggle,
            color: .purple,
            shading: .striped,
            isFaceUp: true,
            backView: CardBackView())
    }
}

struct CardSetGameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(game: CardSetGame())
    }
}
