//
//  GameNavigation.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/26/23.
//

import Foundation
import SwiftUI

public class GameState: ObservableObject
{
    @Published public var currentView: MainViewSetting
    @Published public var scene: WaypointScene
    @Published public var backpack: Backpack
    @Published public var itemGroup: Int
    @Published public var itemSelection: ObjectIdentifier?
    @Published public var shipPosition: CGPoint
    @Published public var backView: MainViewSetting
    @Published public var backScene: WaypointScene
    @Published public var galaxy: Galaxy
    @Published public var selectedCard: UUID?

    public init()
    {
        self.currentView = .galaxyMap
        self.scene = SceneCollections.space.empty
        self.backpack = Backpack()
        self.itemGroup = 0
        self.itemSelection = nil
        self.shipPosition = CGPoint(x: 383, y: 370)
        self.backView = .shipExterior
        self.backScene = SceneCollections.space.empty
        self.galaxy = Galaxy(map: "GalaxyMap2", waypoints: [
            Waypoint(type: .star, color: .red, x: 172, y: 175, scene: SceneCollections.star.red, known: true),
            Waypoint(type: .planet, color: .blue, x: 234, y: 257, scene: SceneCollections.planet.nature, known: true),
            Waypoint(type: .planet, color: .blue, x: 436, y: 317, scene: SceneCollections.planet.water, known: true),
            Waypoint(type: .planet, color: .blue, x: 536, y: 317, scene: SceneCollections.planet.weird, known: true),
            Waypoint(type: .planet, color: .blue, x: 636, y: 417, scene: SceneCollections.planet.garden, known: true),
            Waypoint(type: .planet, color: .blue, x: 136, y: 117, scene: SceneCollections.planet.desert, known: true),
            Waypoint(type: .anomaly, color: .purple, x: 336, y: 217, scene: SceneCollections.anomaly.rainbow, known: true),
        ])
        self.selectedCard = nil
    }
}
