//
//  CardDeck.swift
//  Memory Game
//
//  Created by Pavel Novik on 1/23/19.
//  Copyright © 2019 Novik. All rights reserved.
//

import Foundation

struct CardDeck {

    // MARK: - PROPERTIES -

    private let cardsImages = [
        "memoryBatCardFront",
        "memoryCatCardFront",
        "memoryCowCardFront",
        "memoryDragonFront",
        "memoryGarbageManCardFront",
        "memoryGhostDogCardFront",
        "memoryHenCardFront",
        "memoryHorseCardFront",
        "memoryPigCardFront",
        "memorySpiderCardFront"
    ]

    var numberOfCards: Int
    private var cards = [Card]()
    private var firstUnpairedCard: Card?

    // MARK: - INIT -

    init(numberOfCards: Int) {
        self.numberOfCards = numberOfCards
        setupDeck()
    }

    // MARK: - FUNCTIONS -

    private mutating func setupDeck() {
        for index in 0..<numberOfCards/2 {
            let card = Card(imageName: cardsImages[index])
            cards.append(contentsOf: [card, card.makeCopy()]) // add a pair
        }
        cards.shuffle()
    }

}

// MARK: - ACTIONS -

extension CardDeck {

    func card(at index: Int) -> Card? {
        guard index < cards.count && index >= 0 else { return nil }
        return cards[index]
    }

    func index(for card: Card) -> Int? {
        return cards.index(of: card)
    }

    // If only one card is open or if it's a match, will return a nil. Do nothing.
    // Else it will return unmatched cards if two cards are open and not a match
    mutating func isMatch(card: Card) -> [Card]? {
        guard let firstUnpairedCard = firstUnpairedCard else {
            self.firstUnpairedCard = card
            return nil
        }

        self.firstUnpairedCard = nil // received second card, reset first card

        if firstUnpairedCard.isMatch(of: card) {
            return nil
        }

        return [firstUnpairedCard, card]
    }

}
