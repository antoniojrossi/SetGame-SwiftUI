//
//  LogoView.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 07/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import SwiftUI

struct CardBackView: View {
    
    // MARK: Properties
    
    var backgroundColor = Color.clear
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    
    // MARK: Functions
    
    private func body(for size: CGSize) -> some View {
        VStack {
            Spacer(minLength: 0)
            HStack(spacing: horizontalSpacing(for: size)) {
                Spacer(minLength: 0)
                ZStack{
                    Rectangle()
                        .fill(squareColor)
                        .frame(width: squareWidth(for: size), height: squareWidth(for: size), alignment: .center)
                    Text("S")
                        .font(firstLetterFont(for: size))
                }
                ZStack {
                    Rectangle()
                        .fill(squareColor)
                        .frame(width: squareWidth(for: size), height: squareWidth(for: size), alignment: .center)
                    Text("E")

                }
                ZStack {
                    Rectangle()
                        .fill(squareColor)
                        .frame(width: squareWidth(for: size), height: squareWidth(for: size), alignment: .center)
                    Text("T")
                }
                Spacer(minLength: 0)
            }
            Spacer(minLength: 0)
        }
        .font(letterFont(for: size))
        .foregroundColor(fontColor)
        .background(backgroundColor)
    }
    
    // MARK: Drawing Constants
    
    private let squareColor = Color.white
    private let fontColor = Color.black
    private func horizontalSpacing(for size: CGSize) -> CGFloat { size.width / 75 }
    private func squareWidth(for size: CGSize) -> CGFloat { size.width / 4 }
    private func firstLetterFont(for size: CGSize) -> Font {
        Font.custom("Bodoni 72", size: size.width / 2).weight(.ultraLight)
    }
    private func letterFont(for size: CGSize) -> Font {
        Font.custom("Bodoni 72", size: size.width / 5)
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        let color = Color(red: 0.694, green: 0.612, blue: 0.851)
        return Group {
            CardBackView(backgroundColor: color)
            CardBackView(backgroundColor: color).frame(width: 50, height: 75, alignment: .center)
        }
    }
}
