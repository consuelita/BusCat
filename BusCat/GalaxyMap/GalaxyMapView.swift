//
//  GalaxyMapView.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/26/23.
//

import Foundation

import SwiftUI

struct GalaxyMapView: View {
    @State var galaxy: Galaxy

    var body: some View {
        ZStack
        {
            VStack {
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let galaxy = Galaxy(map: "GalaxyMap2", waypoints: [
            Waypoint(type: .star, color: .red, x: 335, y: 337, scene: .none),
            Waypoint(type: .planet, color: .blue, x: 465, y: 500, scene: .nature),
            Waypoint(type: .anomaly, color: .purple, x: 665, y: 410, scene: .anomaly),
        ])

        GalaxyMapView(galaxy: galaxy)
    }
}
