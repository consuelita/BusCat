//
//  Hand.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 8/31/23.
//

import Foundation

public struct Hand
{
    public var cards: [Card]

    public init()
    {
        self.cards = []
    }

    public init(cards: [Card])
    {
        self.cards = cards
    }
}
