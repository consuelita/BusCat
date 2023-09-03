//
//  HorizontalActionBar.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/29/23.
//

import SwiftUI

struct HorizontalActionBar: View
{
    @State var actions: ActionCollection
    @EnvironmentObject var navigation: GameState

    var body: some View
    {
        HStack(spacing: 4)
        {
            ForEach($actions.actions.wrappedValue)
            {
                action in

                Button(action: { self.actionButtonPressed(action) })
                {
                    if action.hidden
                    {
                        action.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .font(.system(size: 30))
                        .frame(width: 32, height: 32)
                        .hidden()
                    }
                    else
                    {
                        action.image
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .font(.system(size: 30))
                        .frame(width: 32, height: 32)
                        .foregroundColor(.white)
                    }
                }
                .buttonStyle(.plain)
                .border(.gray, width: 1)
            }
        }
    }

    func actionButtonPressed(_ action: Action)
    {
        action.callback(navigation)
    }
}

struct HorizontalActionBar_Previews: PreviewProvider
{
    static var previews: some View
    {
        HorizontalActionBar(actions: ActionCollections.sceneTop)
    }

    static func callback()
    {
    }
}
