//
//  WaypointScene.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/31/23.
//

import Foundation

public struct WaypointScene
{
    public let name: String
    public let type: SceneType
    public let imageName: String

    public init(_ name: String, _ type: SceneType, _ imageName: String)
    {
        self.name = name
        self.type = type
        self.imageName = imageName
    }
}
