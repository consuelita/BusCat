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
                Button(action: self.starClicked)
                {
                    Image(systemName: "star")
                    .foregroundColor(.red)
                }
                .position(CGPoint(x: self.x, y: self.y))
                .buttonStyle(.plain)

            case .planet:
                Button(action: self.planetClicked)
                {
                    Image(systemName: "globe")
                        .foregroundColor(.blue)
                }
                .position(CGPoint(x: self.x, y: self.y))
                .buttonStyle(.plain)

            case .anomaly:
                Button(action: self.anomalyClicked)
                {
                    Image(systemName: "questionmark.circle.fill")
                        .foregroundColor(.purple)
                }
                .position(CGPoint(x: self.x, y: self.y))
                .buttonStyle(.plain)
        }
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
        MapPointOfInterest(type: .anomaly, x: 300, y: 300)
    }
}
