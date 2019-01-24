//
//  Card.swift
//  Memory Game
//
//  Created by Pavel Novik on 1/23/19.
//  Copyright © 2019 Novik. All rights reserved.
//

import Foundation

struct Card {

    // MARK: - PROPERTIES -

    var identifier: UUID
    var imageName: String

    // MARK: - INIT -

    init(imageName: String) {
        self.imageName = imageName
        self.identifier = UUID()
    }

}

// MARK: - ACTIONS -

extension Card {

    func makeCopy() -> Card {
        return Card(imageName: imageName)
    }

    func isMatch(of card: Card) -> Bool {
        return card.imageName == imageName
    }

}

// MARK: - EQUATABLE -

extension Card: Equatable {

    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }

}
