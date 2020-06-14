//
//  CardBackground.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 12/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import SwiftUI

struct CardBackground: View {
    
    // MARK: Properties
    
    var isFaceUp = false
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    // MARK: Functions
    
    private func body(for size: CGSize) -> some View {
        RoundedRectangle(cornerRadius: cornerRadius(for: size))
            .fill(isFaceUp ? faceUpBackgroundColor : faceDownBackgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius(for: size))
                    .stroke(lineWidth: borderWidth(for: size)).foregroundColor(bordercolor))
    }
    
    // MARK: Drawing constants
    
    private let faceUpBackgroundColor = Color.white
    private let faceDownBackgroundColor = Color(red: 0.694, green: 0.612, blue: 0.851)
    private let bordercolor = Color(red: 0.25, green: 0.25, blue: 0.25, opacity: 0.25)
    private func cornerRadius(for size: CGSize) -> CGFloat {
        size.width / 20
    }
    private func borderWidth(for size: CGSize) -> CGFloat {
        max(1, size.width / 180)
    }
}

struct CardBackground_Previews: PreviewProvider {
    static var previews: some View {
        CardBackground()
    }
}
