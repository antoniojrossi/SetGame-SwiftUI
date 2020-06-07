//
//  CardView.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 07/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import SwiftUI

struct SetGameCardView: View {
    
    // MARK: Properties
    
    var isFaceUp: Bool = false
    var body: some View {
        GeometryReader { geometry  in
            self.body(for: geometry.size);
        }
    }
    
    // MARK: Functions
    
    func body(for size: CGSize) -> some View {
        SetGameCardFrontView().asCard(isFaceUp: isFaceUp, cardBack: SetGameCardBackView())
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SetGameCardView(isFaceUp: true)
            SetGameCardView(isFaceUp: true).frame(width: 100, height: 130, alignment: .center)
            SetGameCardView(isFaceUp: true).frame(width: 200, height: 250, alignment: .center)
            SetGameCardView(isFaceUp: false)
            SetGameCardView(isFaceUp: false).frame(width: 100, height: 130, alignment: .center)
        }
    }
}
