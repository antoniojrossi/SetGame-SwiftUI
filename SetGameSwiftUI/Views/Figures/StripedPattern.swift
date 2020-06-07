//
//  StripedPattern.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 07/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import SwiftUI

struct StripedPattern: Shape {
    
    var numberOfStripes: Int
    
    func path(in rect: CGRect) -> Path {
        let stripeWidth = Int(rect.width) / numberOfStripes
        var path = Path()
        path.move(to: rect.origin)
        for index in 0 ..< numberOfStripes {
            if index % 2 == 0 {
                path.addRect(CGRect(
                    x: index * stripeWidth,
                    y: 0,
                    width: stripeWidth,
                    height: Int(rect.height)))
            }
        }
        return path
    }
}

struct Striped_Previews: PreviewProvider {
    static var previews: some View {
        StripedPattern(numberOfStripes: 40)
    }
}
