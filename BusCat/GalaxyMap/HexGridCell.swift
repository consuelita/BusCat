//
//  HexGridCell.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 5/29/24.
//

import Foundation

import HexGrid

public struct HexGridCell: Identifiable, OffsetCoordinateProviding
{
    public var id: Int
    {
        offsetCoordinate.hashValue
    }

    public var offsetCoordinate: OffsetCoordinate
    public var colorName: String

    public init(offsetCoordinate: OffsetCoordinate, colorName: String) 
    {
        self.offsetCoordinate = offsetCoordinate
        self.colorName = colorName
    }
}
