//
//  PlayFigure.swift
//  SetGameSwiftUI
//
//  Created by Antonio J Rossi on 14/06/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import Foundation

protocol PlayFigure {
    func match(with figure1: PlayFigure, and figure2: PlayFigure) -> Bool
    static func all() -> [PlayFigure]
}
