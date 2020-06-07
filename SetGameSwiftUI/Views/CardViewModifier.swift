//
//  CardView.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 07/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import SwiftUI

struct CardViewModifier<BackContent>: ViewModifier where BackContent: View {
    var isFaceUp = false
    var cardBack: BackContent
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            self.body(content, for: geometry.size)
        }
    }
    
    func body(_ content: Content, for size: CGSize) -> some View {
        return ZStack {
            RoundedRectangle(cornerRadius: cornerRadius(for: size))
                .fill(isFaceUp ? faceUpBackgroundColor : faceDownBackgroundColor)
                .shadow(radius: shadowCornerRadius(for: size),
                        x: shadowOffset(for: size),
                        y: shadowOffset(for: size))
            if isFaceUp {
                content
            } else {
                cardBack
            }
        }
        .aspectRatio(cardAspectRatio, contentMode: .fit)
    }
    
    // MARK: Drawing constants
    private let faceUpBackgroundColor = Color.white
    private let faceDownBackgroundColor = Color(red: 0.694, green: 0.612, blue: 0.851)
    private let cardAspectRatio: CGFloat = 3/5
    private func cornerRadius(for size: CGSize) -> CGFloat {
        size.width / 80
    }
    private func shadowCornerRadius(for size: CGSize) -> CGFloat {
        size.width / 80
    }
    private func shadowOffset(for size: CGSize) -> CGFloat {
        size.width / 100
    }
}
