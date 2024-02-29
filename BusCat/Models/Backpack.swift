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
    
    public func tryToStore(item: Item) -> Bool
    {
        let maybeAvailableSpace: (Int, Int)? = self.groups.enumerated().compactMap
        {
            (groupIndex, group) in
            
            guard let availableSlotIndex = group.findItemStackWithSpace(item: item) else
            {
                return nil
            }
            
            return (groupIndex, availableSlotIndex)
        }.first
        
        if let (availableGroupIndex, availableItemSlotIndex) = maybeAvailableSpace
        {
            // We found a stack of the same item with some space, add 1 by increasing the item count
            self.groups[availableGroupIndex].items[availableItemSlotIndex].count += 1
            
            return true
        }
        else
        {
            // We didn't already have a stack of these items, or the stacks were full
            
            let maybeEmptySpace: (Int, Int)? = self.groups.enumerated().compactMap
            {
                (groupIndex, group) in
                
                guard let availableSlotIndex = group.findEmptySpace() else
                {
                    return nil
                }
                
                return (groupIndex, availableSlotIndex)
            }.first
            
            if let (availableGroupIndex, emptyItemSlotIndex) = maybeEmptySpace
            {
                // We found an empty space, add the item to the empty space
                self.groups[availableGroupIndex].items[emptyItemSlotIndex] = item
                
                return true
            }
            else
            {
                // We couldn't find a stack to add the item to, or an empty space
                return false
            }
        }
        
    }
}
