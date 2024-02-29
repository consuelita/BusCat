//
//  Item.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/30/23.
//

import Foundation
import SwiftUI

public struct Item
{
//    static public let empty = Item(name: "empty", imageName: "fish", hidden: false, callback: Self.emptyClicked)
    static public var empty: Item
    {
        // Generate new items each time, with new ids
        return Item(name: "empty", imageName: "circle.slash", hidden: true, callback: Self.emptyClicked)
    }

    static public var fish: Item
    {
        // Generate new items each time, with new ids
        return Item(name: "fish", imageName: "fish", hidden: false, callback: Self.fishClicked)
    }

    static func emptyClicked(_ state: GameState)
    {
        print("Empty clicked")
    }

    static func fishClicked(_ state: GameState)
    {
        print("Empty clicked")
    }

    public let name: String
    public let image: Image
    public var count: Int
    public let maxStackSize: Int = 10
    public let callback: (GameState) -> Void
    public let hidden: Bool

    public init(name: String, imageName: String, hidden: Bool = false, callback: @escaping (GameState) -> Void)
    {
        let image = Image(systemName: imageName)

        self.init(name: name, image: image, count: 1, hidden: hidden, callback: callback)
    }

    public init(name: String, image: Image, count: Int, hidden: Bool = false, callback: @escaping (GameState) -> Void)
    {
        self.name = name
        self.image = image
        self.count = count
        self.hidden = hidden
        self.callback = callback
    }
}

extension Item: Identifiable
{
    public var id: ObjectIdentifier
    {
        return ObjectIdentifier(ActionIdentifier(self.name))
    }
}

public class ItemIdentifier
{
    public let id: String

    public init(_ name: String)
    {
        let uuid = UUID()
        self.id = "\(name)-\(uuid.uuidString)"
    }
}

