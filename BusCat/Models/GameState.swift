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
    @Published public var sceneType: SceneType
    @Published public var backpack: Backpack
    @Published public var itemGroup: Int

    public init()
    {
        self.currentView = .galaxyMap
        self.sceneType = .none
        self.backpack = Backpack()
        self.itemGroup = 0
    }
}
