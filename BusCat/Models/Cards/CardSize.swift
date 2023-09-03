//
//  CardSize.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 8/31/23.
//

import Foundation

public enum CardSize
{
    case poker
    case tarot
    case bridge

    public var width: CGFloat
    {
        switch self
        {
            case .poker:
                return 64

            case .tarot:
                return 70

            case .bridge:
                return 57
        }
    }

    public var height: CGFloat
    {
        switch self
        {
            case .poker:
                return 89

            case .tarot:
                return 121

            case .bridge:
                return 89
        }
    }
}
