//
//  MapPointOfInterest.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/26/23.
//

import SwiftUI

struct MapPointOfInterest: View
{
    @EnvironmentObject var navigation: GameNavigation
    @State var waypoint: Waypoint

    var body: some View
    {
        Button(action: self.starClicked)
        {
            Image(systemName: $waypoint.type.wrappedValue.rawValue)
            .foregroundColor($waypoint.color.wrappedValue)
        }
        .position(CGPoint(x: $waypoint.x.wrappedValue, y: $waypoint.y.wrappedValue))
        .buttonStyle(.plain)
    }

    func starClicked()
    {
        print("Clicked star, changing to scene")
        navigation.sceneType = .none
        navigation.currentView = .scene
    }

    func planetClicked()
    {
        print("Clicked planet, changing to scene")
        navigation.sceneType = .nature
        navigation.currentView = .scene
    }

    func anomalyClicked()
    {
        print("Clicked anomaly, changing to scene")
        navigation.sceneType = .anomaly
        navigation.currentView = .scene
    }
}

struct MapPointOfInterest_Previews: PreviewProvider
{
    static var previews: some View
    {
        let waypoint = Waypoint(type: .star, color: .red, x: 335, y: 337, scene: .none)
        MapPointOfInterest(waypoint: waypoint)
    }
}
