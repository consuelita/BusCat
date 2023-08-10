//
//  SceneView.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/26/23.
//

import SwiftUI

struct SceneView: View
{
    @State var scene: WaypointScene
    @State var selection: Int = 0
    @EnvironmentObject var state: GameState

    var body: some View
    {
        VStack
        {
            ZStack
            {
                HStack
                {
                    Button(action: self.shipClicked)
                    {
                        if let image = NSImage(named: NSImage.Name("Ship"))
                        {
                            Image(nsImage: image)
                                .resizable()
                                .frame(width: 64, height: 64)
                                .padding(.leading, 128)
                                .padding(.top, 10)
                                .padding(.bottom, 0)
                        }
                    }
                    .buttonStyle(.plain)

                    Spacer()
                }

                HorizontalActionBar(actions: ActionCollections.activityTop)
                    .padding(.top, 10)
            }
            HStack
            {
                ZStack
                {
                    VStack {
                        if let image = NSImage(named: NSImage.Name(scene.imageName))
                        {
                            Image(nsImage: image)
                        }
                    }
                    .padding()
                }

                VerticalInventoryBar()
                .padding(.trailing, 10)
            }

            // Inventory
            HorizontalActionBar(actions: ActionCollections.sceneBottom)
            .padding(.bottom, 10)
        }
    }

    public func shipClicked()
    {
        state.currentView = .shipExterior
    }
}

struct SceneView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SceneView(scene: SceneCollections.planet.nature)
    }
}
