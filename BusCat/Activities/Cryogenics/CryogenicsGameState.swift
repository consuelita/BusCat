//
//  CryogenicsGameState.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 9/1/23.
//

import Foundation
import SwiftUI

public enum CryogenicsSubviewType
{
    case main
    case homeworlds
    case backgrounds
    case professions
    case connections
}

public struct CryogenicsGameState
{
    public var subview: CryogenicsSubviewType = .main
    public var homeworld: Card? = nil
    public var background: Card? = nil
    public var profession: Card? = nil
    public var connection: Card? = nil

    public init()
    {
    }
}
