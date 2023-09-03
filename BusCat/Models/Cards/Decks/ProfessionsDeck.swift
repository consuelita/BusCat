//
//  ProfessionsDeck.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 8/31/23.
//

import Foundation
import SwiftUI

public struct Profession
{
    static let professions: [Profession] = [
        Profession(
            name: "Fisher",
            abilities: [
                Ability(type: .fishing, level: .basic)
            ],
            traits: [
                Trait(description: "Surly"),
                Trait(description: "Nature Lover"),
            ]
        )
    ]

    let name: String
    let abilities: [Ability]
    let traits: [Trait]
}

public class ProfessionsDeck: Deck
{
    public init()
    {
        super.init()

        guard let nsBack = NSImage(named: NSImage.Name("Professions")) else
        {
            return
        }

        let back = Image(nsImage: nsBack)

        self.cards = Profession.professions.compactMap
        {
            profession in

            guard let nsFront = NSImage(named: NSImage.Name(profession.name)) else
            {
                return nil
            }

            let front = Image(nsImage: nsFront)

            return Card(name: profession.name, size: .poker, front: front, back: back, identifier: UUID())
        }
    }
}

public enum ProfessionsDeckError: Error
{
    case failedToLoadImage
}
