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
                                .frame(width: 32, height: 32)
                                .padding(.leading, 64)
                                .padding(.top, 5)
                                .padding(.bottom, 0)
                        }
                    }
                    .buttonStyle(.plain)

                    Spacer()
                }

                HorizontalActionBar(actions: ActionCollections.activityTop)
                    .padding(.top, 5)
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
                .padding(.trailing, 5)
            }

            // Inventory
            HorizontalActionBar(actions: ActionCollections.sceneBottom)
            .padding(.bottom, 5)
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
