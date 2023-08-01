//
//  BusCatApp.swift
//  BusCat
//
//  Created by Mafalda on 7/26/23.
//

import SwiftUI

@main
struct BusCatApp: App {
    var body: some Scene {
        WindowGroup {
            let galaxy = Galaxy(map: "GalaxyMap2", waypoints: [
                Waypoint(type: .star, color: .red, x: 335, y: 337, scene: SceneCollections.star.red),
                Waypoint(type: .planet, color: .blue, x: 465, y: 500, scene: SceneCollections.planet.nature),
                Waypoint(type: .anomaly, color: .purple, x: 665, y: 410, scene: SceneCollections.anomaly.rainbow),
            ])

            MainScreenView(galaxy: galaxy)
        }
    }
}
