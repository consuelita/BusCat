//
//  Pile.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 8/31/23.
//

import Foundation

public class Pile
{
    public var cards: [Card]

    public init(cards: [Card])
    {
        self.cards = cards

        for card in self.cards
        {
            card.turnFaceUp()
        }
    }

    public func draw(turnFaceDown: Bool = true) throws -> Card
    {
        guard !self.cards.isEmpty else
        {
            throw DeckError.deckIsEmpty
        }

        let index = Int.random(in: 0..<self.cards.count)
        let card = self.cards[index]
        self.cards.remove(at: index)

        if turnFaceDown
        {
            card.turnFaceDown()
        }

        return card
    }
}
