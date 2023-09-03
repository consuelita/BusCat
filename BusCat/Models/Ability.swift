//
//  Ability.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 8/31/23.
//

import Foundation

public enum AbilityType: String, Hashable
{
    case botany = "Botany"
    case fishing = "Fishing"
    case geology = "Geology"
    case lore = "Lore"
    case negotiation = "Negotiation"
    case piloting = "Piloting"
    case sailing = "Sailing"
    case swimming = "Swimming"
}

public enum AbilityLevel: Int
{
    case basic = 1
    case general = 2
    case advanced = 3
    case expert = 4
    case genius = 5
}

extension AbilityLevel: CustomStringConvertible
{
    public var description: String
    {
        switch self
        {
            case .basic:
                return "Basic"

            case .general:
                return "General"

            case .advanced:
                return "Advanced"

            case .expert:
                return "Expert"

            case .genius:
                return "Genius"
        }
    }
}

public struct Ability
{
    public var type: AbilityType
    public var level: AbilityLevel

    public init(type: AbilityType, level: AbilityLevel)
    {
        self.type = type
        self.level = level
    }
}

extension Ability: Hashable
{
    public func hash(into hasher: inout Hasher)
    {
        hasher.combine(self.type)
    }
}
