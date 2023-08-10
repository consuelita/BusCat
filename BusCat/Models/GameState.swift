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

    public init()
    {
        self.currentView = .galaxyMap
        self.scene = SceneCollections.space.empty
        self.backpack = Backpack()
        self.itemGroup = 0
        self.itemSelection = nil
        self.shipPosition = CGPoint(x: 750, y: 710)
        self.backView = .shipExterior
        self.backScene = SceneCollections.space.empty
    }
}
