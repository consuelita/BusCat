//
//  Deck.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 8/31/23.
//

import Foundation

public class Deck
{
    public var defaultSize: CardSize
    public var cards: [Card]

    public init(defaultSize: CardSize = .poker)
    {
        self.defaultSize = defaultSize
        self.cards = []
    }

    public init(cards: [Card])
    {
        self.cards = cards

        if let card = cards.first
        {
            self.defaultSize = card.size
        }
        else
        {
            self.defaultSize = .poker
        }
    }

    public func copy() -> Deck
    {
        return Deck(cards: self.cards)
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

public enum DeckError: Error
{
    case deckIsEmpty
}
