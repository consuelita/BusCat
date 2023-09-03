//
//  ConnectionsDeck.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 8/31/23.
//

import Foundation
import SwiftUI

public struct Connection
{
    static let connections: [Connection] = [
        Connection(
            name: "Sibling",
            abilities: [
                Ability(type: .fishing, level: .basic)
            ],
            traits: [
                Trait(description: "Obstinate"),
            ]
        )
    ]

    let name: String
    let abilities: [Ability]
    let traits: [Trait]
}

public class ConnectionsDeck: Deck
{
    public init()
    {
        super.init()

        guard let nsBack = NSImage(named: NSImage.Name("Connections")) else
        {
            return
        }

        let back = Image(nsImage: nsBack)

        self.cards = Connection.connections.compactMap
        {
            connection in

            guard let nsFront = NSImage(named: NSImage.Name(connection.name)) else
            {
                return nil
            }

            let front = Image(nsImage: nsFront)

            return Card(name: connection.name, size: .poker, front: front, back: back, identifier: UUID())
        }
    }
}

public enum ConnectionsDeckError: Error
{
    case failedToLoadImage
}
