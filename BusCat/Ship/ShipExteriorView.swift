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
                    .padding(.top, 5)

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
                            .frame(width: 256, height: 256)
                    }

                    Spacer()

                    VStack
                    {
                        Button(action: self.captainClicked)
                        {
                            HStack
                            {
                                Image(systemName: "chair.lounge")
                                .font(.system(size: 15))
                                .foregroundColor(.white)

                                Text("Captain's Chair")

                                Spacer()
                            }
                        }
                        .padding(.top, 8)
                        .padding(.bottom, 8)

                        Button(action: self.astronavigationClicked)
                        {
                            HStack
                            {
                                Image(systemName: "star")
                                .font(.system(size: 15))
                                .foregroundColor(.white)

                                Text("Astronavigation")

                                Spacer()
                            }
                        }
                        .padding(.top, 8)
                        .padding(.bottom, 8)

                        Button(action: self.engineeringClicked)
                        {
                            HStack
                            {
                                Image(systemName: "gear")
                                .font(.system(size: 15))
                                .foregroundColor(.white)

                                Text("Engineering")

                                Spacer()
                            }
                        }
                        .padding(.top, 8)
                        .padding(.bottom, 8)

                        Button(action: self.cryogenicsClicked)
                        {
                            HStack
                            {
                                Image(systemName: "snowflake.circle")
                                    .font(.system(size: 15))
                                    .foregroundColor(.white)

                                Text("Cryogenics")

                                Spacer()
                            }
                        }
                        .padding(.top, 8)
                        .padding(.bottom, 8)
                    }
                    .buttonStyle(.plain)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .padding(.leading, 50)
                }

                Spacer()
            }
        }
    }

    public func captainClicked()
    {
        self.state.scene = SceneCollections.captain.ship1
        self.state.currentView = .shipInterior
    }

    public func astronavigationClicked()
    {
        self.state.scene = SceneCollections.navigation.ship1
        self.state.currentView = .shipInterior
    }

    public func engineeringClicked()
    {
        self.state.scene = SceneCollections.engineering.ship1
        self.state.currentView = .shipInterior
    }

    public func cryogenicsClicked()
    {
        self.state.scene = SceneCollections.cryogenics.ship1
        self.state.currentView = .shipInterior
    }
}

struct ShipExteriorView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ShipExteriorView()
    }
}
