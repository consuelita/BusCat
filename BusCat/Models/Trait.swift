//
//  Trait.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 8/31/23.
//

import Foundation

public struct Trait: CustomStringConvertible
{
    public var description: String

    public init(description: String)
    {
        self.description = description
    }
}

extension Trait: Hashable
{
    public func hash(into hasher: inout Hasher)
    {
        hasher.combine(self.description)
    }
}
