//
//  MainScreeen.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/26/23.
//

import SwiftUI

struct MainScreenView: View
{
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
                        GalaxyMapView(galaxy: $state.galaxy.wrappedValue)

                    case .scene:
                        SceneView(scene: $state.scene.wrappedValue)

                    case .backpack:
                        BackpackView()

                    case .fishing:
                        FishingView()

                    case .shipExterior:
                        ShipExteriorView()

                    case .shipInterior:
                        ShipInteriorView(scene: $state.scene.wrappedValue)

                    case .cryogenics:
                        CryogenicsMinigameView()
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
        MainScreenView()
    }
}
