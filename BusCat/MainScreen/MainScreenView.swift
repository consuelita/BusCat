//
//  MainScreeen.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/26/23.
//

import SwiftUI

struct MainScreenView: View
{
    @StateObject var navigation: GameNavigation = GameNavigation()

    var body: some View
    {
        NavigationStack
        {
            switch $navigation.currentView.wrappedValue
            {
                case .galaxyMap:
                    GalaxyMapView()

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
        MainScreenView()
    }
}
