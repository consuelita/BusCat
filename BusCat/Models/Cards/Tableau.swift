//
//  Tableau.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 8/31/23.
//

import Foundation

public class Tableau
{
    public let width: UInt
    public let height: UInt

    public var cards: [Card]

    public init(cards: [Card], width: UInt, height: UInt)
    {
        self.cards = cards
        self.width = width
        self.height = height
    }
}
