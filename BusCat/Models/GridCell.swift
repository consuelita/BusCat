//
//  GridCell.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/27/23.
//

import Foundation
import SwiftUI

class GridCell: Identifiable
{
    public typealias ID = Int

    public let id: Int

    public func getView() -> some View
    {
        return Rectangle()
    }

    public init(_ id: Int)
    {
        self.id = id
    }
}
