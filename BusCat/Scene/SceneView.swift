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
    @State var selection: Int = 0
    @EnvironmentObject var navigtion: GameNavigation

    var body: some View
    {
        VStack
        {
            HorizontalActionBar(actions: ActionCollections.top)
            .padding(.top, 10)

            HStack
            {
//                VerticalActionBar(actions: ActionCollections.left)
//                .padding(.right, 10)

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

                Text("Status Effects")
            }

            // Inventory
            HorizontalActionBar(actions: ActionCollections.bottom)
            .padding(.bottom, 10)
        }
    }

    func mapClicked()
    {
        self.navigtion.currentView = .galaxyMap
    }

    func takeAction()
    {
        print("action clicked")
    }
}

struct SceneView_Previews: PreviewProvider {
    static var previews: some View {
        SceneView(type: .nature)
    }
}
