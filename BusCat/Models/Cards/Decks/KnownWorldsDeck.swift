//
//  KnownWorldsDeck.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 8/31/23.
//

import Foundation
import SwiftUI

public struct Homeworld
{
    static let homeworlds: [Homeworld] = [
        Homeworld(
            name: "Maro Prime",
            abilities: [
                Ability(type: .fishing, level: .basic),
                Ability(type: .swimming, level: .basic),
                Ability(type: .sailing, level: .basic),
            ],
            traits: [
            ]
        ),
        Homeworld(
            name: "Floranta III",
            abilities: [
                Ability(type: .botany, level: .basic)
            ],
            traits: [
            ]
        ),
        Homeworld(
            name: "Sablo Alpha",
            abilities: [
            ],
            traits: [
            ]
        ),
        Homeworld(
            name: "Lageto IV",
            abilities: [
                Ability(type: .fishing, level: .basic),
            ],
            traits: [
            ]
        ),
        Homeworld(
            name: "Nekutima",
            abilities: [
                Ability(type: .botany, level: .basic)
            ],
            traits: [
            ]
        )
    ]

    let name: String
    let abilities: [Ability]
    let traits: [Trait]
}

public class KnownWorldsDeck: Deck
{
    public init(galaxy: Galaxy) throws
    {
        super.init()

        guard let nsBack = NSImage(named: NSImage.Name("Homeworlds")) else
        {
            throw KnownWorldsDeckError.failedToLoadImage
        }

        let back = Image(nsImage: nsBack)

        let knownWorlds = galaxy.waypoints.filter
        {
            waypoint in

            return waypoint.type == .planet
        }

        self.cards = try knownWorlds.map
        {
            waypoint in

            guard let nsFront = NSImage(named: NSImage.Name(waypoint.scene.imageName)) else
            {
                throw KnownWorldsDeckError.failedToLoadImage
            }

            let front = Image(nsImage: nsFront)

            return Card(name: waypoint.scene.name, size: .poker, front: front, back: back, identifier: UUID())
        }
    }
}

public enum KnownWorldsDeckError: Error
{
    case failedToLoadImage
}
