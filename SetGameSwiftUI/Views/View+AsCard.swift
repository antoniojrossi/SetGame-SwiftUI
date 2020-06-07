//
//  View+AsCard.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 07/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import SwiftUI

extension View {
    func asCard<CardBack>(isFaceUp: Bool, cardBack: CardBack) -> some View where CardBack: View {
        self.modifier(CardViewModifier(isFaceUp: isFaceUp, cardBack: cardBack))
    }
}
