//
//  MapPointOfInterest.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/26/23.
//

import SwiftUI

struct MapPointOfInterest: View
{
    @EnvironmentObject var navigation: GameState
    @State var waypoint: Waypoint

    var body: some View
    {
        Button(action: self.clicked)
        {
            Image(systemName: $waypoint.type.wrappedValue.rawValue)
            .font(.system(size: 15))
            .foregroundColor($waypoint.color.wrappedValue)
        }
        .position(CGPoint(x: $waypoint.x.wrappedValue, y: $waypoint.y.wrappedValue))
        .buttonStyle(.plain)
    }

    func clicked()
    {
        print("Clicked waypoint, changing to scene")
        navigation.scene = waypoint.scene
        navigation.currentView = .scene
    }
}

struct MapPointOfInterest_Previews: PreviewProvider
{
    static var previews: some View
    {
        let waypoint = Waypoint(type: .star, color: .red, x: 167, y: 168, scene: SceneCollections.star.red, known: true)
        MapPointOfInterest(waypoint: waypoint)
    }
}
