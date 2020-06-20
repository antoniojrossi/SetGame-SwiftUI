//
//  SetMatchable.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 20/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import Foundation

protocol SetFeatureCategory {
    associatedtype Content
}

extension SetFeatureCategory {
    static func isASet<Content>(content1: Content, content2: Content, content3: Content) -> Bool where Content: Equatable {
        return (content1 == content2 && content2 == content3) ||
               (content1 != content2 && content1 != content3 && content2 != content3)
    }
}
