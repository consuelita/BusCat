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
            HorizontalActionBar(actions: ActionCollections.top)
            .padding(.top, 10)

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
            HorizontalActionBar(actions: ActionCollections.bottom)
            .padding(.bottom, 10)
        }
    }

    func mapClicked()
    {
        self.state.currentView = .galaxyMap
    }

    func takeAction()
    {
        print("action clicked")
    }
}

struct SceneView_Previews: PreviewProvider {
    static var previews: some View {
        SceneView(scene: SceneCollections.planet.nature)
    }
}
