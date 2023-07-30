//
//  Backpack.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/30/23.
//

import Foundation

public struct Backpack
{
    public var groups: [ItemGroup]

    public init()
    {
        let empty = Item.empty

        self.groups = [
            ItemGroup(items: [empty, empty, empty, empty, empty, empty, empty, empty]),
            ItemGroup(items: [empty, empty, empty, empty, empty, empty, empty, empty]),
            ItemGroup(items: [empty, empty, empty, empty, empty, empty, empty, empty]),
            ItemGroup(items: [empty, empty, empty, empty, empty, empty, empty, empty]),
            ItemGroup(items: [empty, empty, empty, empty, empty, empty, empty, empty]),
            ItemGroup(items: [empty, empty, empty, empty, empty, empty, empty, empty]),
            ItemGroup(items: [empty, empty, empty, empty, empty, empty, empty, empty]),
            ItemGroup(items: [empty, empty, empty, empty, empty, empty, empty, empty]),
        ]
    }

    public init(_ items: [ItemGroup])
    {
        self.groups = items
    }
}
