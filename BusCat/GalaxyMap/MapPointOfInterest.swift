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
    @State var type: PointOfInterestType
    @State var x: Double
    @State var y: Double

    var body: some View
    {
        switch $type.wrappedValue
        {
            case .star:
                Button(action: self.waypointClicked)
                {
                    Image(systemName: "star")
                    .foregroundColor(.red)
                }
                .position(CGPoint(x: self.x, y: self.y))
                .buttonStyle(.plain)

            case .planet:
                Button(action: self.waypointClicked)
                {
                    Image(systemName: "globe")
                        .foregroundColor(.blue)
                }
                .position(CGPoint(x: self.x, y: self.y))
                .buttonStyle(.plain)

            case .anomaly:
                Button(action: self.waypointClicked)
                {
                    Image(systemName: "questionmark.circle.fill")
                        .foregroundColor(.purple)
                }
                .position(CGPoint(x: self.x, y: self.y))
                .buttonStyle(.plain)
        }
    }

    func waypointClicked()
    {
        print("Clicked, changing to scene")
        navigation.currentView = .scene
    }
}

struct MapPointOfInterest_Previews: PreviewProvider
{
    static var previews: some View
    {
        MapPointOfInterest(type: .anomaly, x: 300, y: 300)
    }
}
