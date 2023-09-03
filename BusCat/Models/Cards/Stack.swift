//
//  Stack.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 8/31/23.
//

import Foundation

public class Stack
{
    public var defaultSize: CardSize
    public var cards: [Card]

    public init()
    {
        self.defaultSize = .poker
        self.cards = []
    }

    public init(cards: [Card])
    {
        self.cards = cards

        for card in self.cards
        {
            card.turnFaceDown()
        }

        if let card = cards.first
        {
            self.defaultSize = card.size
        }
        else
        {
            self.defaultSize = .poker
        }
    }

    public func shuffle()
    {
        self.cards.shuffle()
    }

    public func draw(turnFaceUp: Bool = true) throws -> Card
    {
        guard !self.cards.isEmpty else
        {
            throw DeckError.deckIsEmpty
        }

        let index = Int.random(in: 0..<self.cards.count)
        let card = self.cards[index]
        self.cards.remove(at: index)

        if turnFaceUp
        {
            card.turnFaceUp()
        }

        return card
    }
}
