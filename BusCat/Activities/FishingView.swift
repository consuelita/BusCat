//
//  FishingView.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 8/3/23.
//

import SwiftUI

struct FishingView: View
{
    @EnvironmentObject var state: GameState

    var body: some View
    {
        VStack
        {
            ZStack
            {
                HStack
                {
                    Button(action: self.sceneClicked)
                    {
                        if let image = NSImage(named: NSImage.Name(state.scene.imageName))
                        {
                            Image(nsImage: image)
                                .resizable()
                                .frame(width: 64, height: 64)
                                .padding(.leading, 128)
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
                    VStack
                    {
                        if let image = NSImage(named: NSImage.Name("Fishing"))
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
            HorizontalActionBar(actions: ActionCollections.fishingBottom)
                .padding(.bottom, 10)
        }
    }

    public func sceneClicked()
    {
        state.currentView = .scene
    }
}

struct FishingView_Previews: PreviewProvider
{
    static var previews: some View
    {
        FishingView()
    }
}
