//
//  GalaxyMapView.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/26/23.
//

import Foundation

import SwiftUI

struct GalaxyMapView: View
{
    @State var galaxy: Galaxy

    var body: some View
    {
        ZStack
        {
            VStack
            {
                if let image = NSImage(named: NSImage.Name($galaxy.map.wrappedValue))
                {
                    Image(nsImage: image)
                }
            }
            .padding()

            ForEach($galaxy.waypoints.wrappedValue)
            {
                waypoint in

                MapPointOfInterest(waypoint: waypoint)
            }

            ShipMapView()
        }
        .frame(width: 512, height: 512)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let galaxy = Galaxy(map: "GalaxyMap2", waypoints: [
            Waypoint(type: .star, color: .red, x: 167, y: 168, scene: SceneCollections.star.red, known: true),
            Waypoint(type: .planet, color: .blue, x: 232, y: 250, scene: SceneCollections.planet.nature, known: true),
            Waypoint(type: .anomaly, color: .purple, x: 332, y: 205, scene: SceneCollections.anomaly.rainbow, known: true),
        ])

        GalaxyMapView(galaxy: galaxy)
    }
}
