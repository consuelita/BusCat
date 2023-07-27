//
//  SceneView.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/26/23.
//

import SwiftUI

struct SceneView: View
{
    @State var type: SceneType

    var body: some View
    {
        ZStack
        {
            VStack {
                switch $type.wrappedValue
                {
                    case .nature:
                        if let image = NSImage(named: NSImage.Name("NatureScene"))
                        {
                            Image(nsImage: image)
                        }

                    case .anomaly:
                        if let image = NSImage(named: NSImage.Name("AnomalyPlanetRainbow"))
                        {
                            Image(nsImage: image)
                        }

                    case .none:
                        if let image = NSImage(named: NSImage.Name("Space"))
                        {
                            Image(nsImage: image)
                        }
                }
            }
            .padding()
        }
    }
}

struct SceneView_Previews: PreviewProvider {
    static var previews: some View {
        SceneView(type: .nature)
    }
}
