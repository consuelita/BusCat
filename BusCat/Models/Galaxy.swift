//
//  Galaxy.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/27/23.
//

import Foundation

public struct Galaxy
{
    public var map: String
    public var waypoints: [Waypoint]

    public init(map: String, waypoints: [Waypoint])
    {
        self.map = map
        self.waypoints = waypoints
    }
}
