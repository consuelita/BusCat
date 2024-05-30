//
//  GalaxyMapView.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/26/23.
//

import Foundation

import HexGrid
import SwiftUI

struct GalaxyMapView: View
{
    @State var galaxy: Galaxy
    @State var cells: [HexGridCell] = [
        HexGridCell(offsetCoordinate: OffsetCoordinate(row: 0, col: 0), colorName: "blue"),
        HexGridCell(offsetCoordinate: OffsetCoordinate(row: 0, col: 1), colorName: "green"),
        HexGridCell(offsetCoordinate: OffsetCoordinate(row: 1, col: 0), colorName: "purple"),
        HexGridCell(offsetCoordinate: OffsetCoordinate(row: 1, col: 1), colorName: "white"),
        HexGridCell(offsetCoordinate: OffsetCoordinate(row: 2, col: 0), colorName: "blue"),
        HexGridCell(offsetCoordinate: OffsetCoordinate(row: 2, col: 1), colorName: "green"),
        HexGridCell(offsetCoordinate: OffsetCoordinate(row: 3, col: 0), colorName: "purple"),
        HexGridCell(offsetCoordinate: OffsetCoordinate(row: 3, col: 1), colorName: "white"),
    ]

    var body: some View
    {
        ZStack
        {
            Color.blue

            VStack
            {
                HexGrid(cells, spacing: 10)
                {
                    cell in

                    Color(Color.black)

                    Button
                    {
                        self.hexClicked(cell)
                    }
                    label:
                    {
                        Image(systemName: "location.north")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .font(.system(size: 30))
                            .frame(width: 32, height: 32)
                            .foregroundColor(.primary)
                            .colorInvert()
                    }
                    .buttonStyle(PlainButtonStyle())
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

    public func hexClicked(_ cell: HexGridCell)
    {
        print("hex clicked! (\(cell.offsetCoordinate.row), \(cell.offsetCoordinate.col))")
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
