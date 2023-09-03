//
//  Waypoint.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/27/23.
//

import Foundation
import SwiftUI

public struct Waypoint
{
    public var type: PointOfInterestType
    public var color: Color
    public var x: Double
    public var y: Double
    public var scene: WaypointScene
    public var known: Bool

    public init(type: PointOfInterestType, color: Color, x: Double, y: Double, scene: WaypointScene, known: Bool)
    {
        self.type = type
        self.color = color
        self.x = x
        self.y = y
        self.scene = scene
        self.known = known
    }
}

extension Waypoint: Identifiable
{
    public var id: ObjectIdentifier
    {
        return ObjectIdentifier(WaypointIdentifier(self))
    }
}

public class WaypointIdentifier
{
    public var id: String

    public init(_ waypoint: Waypoint)
    {
        id = "\(waypoint.type.rawValue)-\(waypoint.x)-\(waypoint.y)"
    }
}
