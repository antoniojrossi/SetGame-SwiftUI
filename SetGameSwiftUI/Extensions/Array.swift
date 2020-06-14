//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Antonio J Rossi on 31/05/2020.
//  Copyright © 2020 Antonio J Rossi. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching item: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == item.id {
                return index
            }
        }
        return nil
    }
}
