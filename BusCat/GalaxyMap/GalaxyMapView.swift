//
//  GalaxyMapView.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/26/23.
//

import Foundation

import SwiftUI

struct GalaxyMapView: View {
    var body: some View {
        ZStack
        {
            VStack {
                if let image = NSImage(named: NSImage.Name("GalaxyMap2"))
                {
                    Image(nsImage: image)
                }
            }
            .padding()

            MapPointOfInterest(type: .star, x: 335, y: 337)
            MapPointOfInterest(type: .planet, x: 465, y: 500)
            MapPointOfInterest(type: .anomaly, x: 665, y: 410)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GalaxyMapView()
    }
}
