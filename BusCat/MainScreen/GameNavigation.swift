//
//  GameNavigation.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/26/23.
//

import Foundation
import SwiftUI

public class GameNavigation: ObservableObject
{
    @Published public var currentView: MainViewSetting

    public init()
    {
        self.currentView = .galaxyMap
    }
}
