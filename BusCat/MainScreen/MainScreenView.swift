//
//  MainScreeen.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/26/23.
//

import SwiftUI

struct MainScreenView: View
{
    @State var galaxy: Galaxy
    @StateObject var navigation: GameNavigation = GameNavigation()

    var body: some View
    {
        NavigationStack
        {
            switch $navigation.currentView.wrappedValue
            {
                case .galaxyMap:
                    GalaxyMapView(galaxy: $galaxy.wrappedValue)

                case .scene:
                    SceneView(type: $navigation.sceneType.wrappedValue)
            }
        }
        .environmentObject(navigation)
    }
}

struct MainScreenView_Previews: PreviewProvider
{
    static var previews: some View
    {
        let galaxy = Galaxy(map: "GalaxyMap2", waypoints: [
            Waypoint(type: .star, color: .red, x: 335, y: 337, scene: .none),
            Waypoint(type: .planet, color: .blue, x: 465, y: 500, scene: .nature),
            Waypoint(type: .anomaly, color: .purple, x: 665, y: 410, scene: .anomaly),
        ])

        MainScreenView(galaxy: galaxy)
    }
}
