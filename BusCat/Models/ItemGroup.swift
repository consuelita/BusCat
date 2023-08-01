//
//  ItemGroup.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/30/23.
//

import Foundation
import SwiftUI

public class ItemGroup: ObservableObject
{
    static public let empty = ItemGroup(items: [Item.empty, Item.empty, Item.empty, Item.empty, Item.empty, Item.empty, Item.empty, Item.empty])

    @Published public var items: [Item]

    public init()
    {
        self.items = [Item.empty, Item.empty, Item.empty, Item.empty, Item.empty, Item.empty, Item.empty, Item.empty]
    }

    public init(items: [Item])
    {
        self.items = items
    }

    public func isEmpty() -> Bool
    {
        return self.items.reduce(true)
        {
            partialResult, item in

            partialResult && (item.name == "empty")
        }
    }

    public func isFull() -> Bool
    {
        return self.items.reduce(true)
        {
            partialResult, item in

            partialResult && (item.name != "empty")
        }
    }

    public func isStackable() -> Bool
    {
        let firstItem = self.items[0]
        guard firstItem.name != "empty" else
        {
            return false
        }

        return items.reduce(true)
        {
            partialResult, item in

            partialResult && item.name == firstItem.name
        }
    }

    public func findEmptySpace() -> Int?
    {
        for (index, item) in self.items.enumerated()
        {
            if item.name == "empty"
            {
                return index
            }
        }

        return nil
    }
}

extension ItemGroup: Identifiable
{
    public var id: ObjectIdentifier
    {
        return ObjectIdentifier(ItemGroupIdentifier())
    }
}

public class ItemGroupIdentifier
{
    public let id: String

    public init()
    {
        let uuid = UUID()
        self.id = uuid.uuidString
    }
}

extension ItemGroup: Equatable
{
    public static func == (lhs: ItemGroup, rhs: ItemGroup) -> Bool
    {
        return lhs.id == rhs.id
    }
}

extension ItemGroup: Hashable
{
    public func hash(into hasher: inout Hasher)
    {
        hasher.combine(self.id)
    }
}
