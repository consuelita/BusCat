//
//  ShipMapView.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 8/9/23.
//

import SwiftUI

struct ShipMapView: View
{
    @EnvironmentObject var state: GameState

    var body: some View
    {
        Button(action: self.shipClicked)
        {
            if let image = NSImage(named: NSImage.Name("Ship"))
            {
                Image(nsImage: image)
                .resizable()
                .frame(width: 25, height: 25)
            }
        }
        .position(CGPoint(x: $state.shipPosition.x.wrappedValue, y: $state.shipPosition.y.wrappedValue))
        .buttonStyle(.plain)
    }

    public func shipClicked()
    {
        $state.currentView.wrappedValue = .shipExterior
    }
}

struct ShipMapView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ShipMapView()
    }
}
