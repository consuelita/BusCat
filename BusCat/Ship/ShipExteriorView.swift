//
//  ShipExteriorView.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 8/9/23.
//

import SwiftUI

struct ShipExteriorView: View
{
    @EnvironmentObject var state: GameState

    var body: some View
    {
        ZStack
        {
            VStack
            {
                HorizontalActionBar(actions: ActionCollections.activityTop)
                    .padding(.top, 10)

                if let image = NSImage(named: NSImage.Name("Space"))
                {
                    Image(nsImage: image)
                }
            }

            if let image = NSImage(named: NSImage.Name("Ship"))
            {
                Spacer()

                HStack
                {
                    VStack
                    {
                        Image(nsImage: image)
                            .resizable()
                            .frame(width: 512, height: 512)
                    }

                    Spacer()

                    VStack
                    {
                        Button(action: self.captainClicked)
                        {
                            HStack
                            {
                                Image(systemName: "chair.lounge")
                                .font(.system(size: 30))
                                .foregroundColor(.white)

                                Text("Captain's Chair")

                                Spacer()
                            }
                        }
                        .padding(.top, 16)
                        .padding(.bottom, 16)

                        Button(action: self.astronavigationClicked)
                        {
                            HStack
                            {
                                Image(systemName: "star")
                                .font(.system(size: 30))
                                .foregroundColor(.white)

                                Text("Astronavigation")

                                Spacer()
                            }
                        }
                        .padding(.top, 16)
                        .padding(.bottom, 16)

                        Button(action: self.engineeringClicked)
                        {
                            HStack
                            {
                                Image(systemName: "gear")
                                .font(.system(size: 30))
                                .foregroundColor(.white)

                                Text("Engineering")

                                Spacer()
                            }
                        }
                        .padding(.top, 16)
                        .padding(.bottom, 16)
                    }
                    .buttonStyle(.plain)
                    .font(.system(size: 60))
                    .foregroundColor(.white)
                    .padding(.leading, 100)
                }

                Spacer()
            }
        }
    }

    public func captainClicked()
    {
        self.state.scene = SceneCollections.captain.ship1
        self.state.currentView = .scene
    }

    public func astronavigationClicked()
    {
        self.state.scene = SceneCollections.navigation.ship1
        self.state.currentView = .scene
    }

    public func engineeringClicked()
    {
        self.state.scene = SceneCollections.engineering.ship1
        self.state.currentView = .scene
    }
}

struct ShipExteriorView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ShipExteriorView()
    }
}
