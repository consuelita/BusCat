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
    @StateObject var state: GameState = GameState()

    var body: some View
    {
        ZStack
        {
            Color.black
            .ignoresSafeArea()

            NavigationStack
            {
                switch $state.currentView.wrappedValue
                {
                    case .galaxyMap:
                        GalaxyMapView(galaxy: $galaxy.wrappedValue)

                    case .scene:
                        SceneView(type: $state.sceneType.wrappedValue)

                    case .backpack:
                        BackpackView()
                }
            }
            .environmentObject(state)
        }
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
