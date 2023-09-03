//
//  BackgroundsDeck.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 8/31/23.
//

import Foundation
import SwiftUI

public struct Background
{
    static let backgrounds: [Background] = [
        Background(
            name: "Homesteader",
            abilities: [
                Ability(type: .fishing, level: .basic)
            ],
            traits: [
                Trait(description: "Sourdough"),
            ]
        ),
        Background(
            name: "Miner",
            abilities: [
                Ability(type: .geology, level: .basic),
                Ability(type: .piloting, level: .basic),
            ],
            traits: [
                Trait(description: "Roughneck"),
            ]
        ),
        Background(
            name: "Student",
            abilities: [
                Ability(type: .lore, level: .basic)
            ],
            traits: [
            ]
        ),
        Background(
            name: "Merchant",
            abilities: [
                Ability(type: .negotiation, level: .basic)
            ],
            traits: [
            ]
        )
    ]

    let name: String
    let abilities: [Ability]
    let traits: [Trait]
}

public class BackgroundsDeck: Deck
{
    public init()
    {
        super.init()

        guard let nsBack = NSImage(named: NSImage.Name("BackgroundsDay")) else
        {
            return
        }

        let back = Image(nsImage: nsBack)

        self.cards = Background.backgrounds.compactMap
        {
            background in

            guard let nsFront = NSImage(named: NSImage.Name(background.name)) else
            {
                return nil
            }

            let front = Image(nsImage: nsFront)

            return Card(name: background.name, size: .poker, front: front, back: back, identifier: UUID())
        }
    }
}

public enum BackgroundsDeckError: Error
{
    case failedToLoadImage
}
