//
//  VerticalActionBar.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/29/23.
//

import SwiftUI

struct VerticalActionBar: View
{
    @State var actions: ActionCollection
    @EnvironmentObject var navigation: GameState

    var body: some View
    {
        VStack(spacing: 4)
        {
            ForEach($actions.actions.wrappedValue)
            {
                action in

                Button(action: { self.actionButtonPressed(action) })
                {
                    if action.hidden
                    {
                        action.image
                            .font(.system(size: 30))
                            .hidden()
                    }
                    else
                    {
                        action.image
                            .font(.system(size: 30))
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

struct VerticalActionBar_Previews: PreviewProvider
{
    static var previews: some View
    {
        VerticalActionBar(actions: ActionCollections.sceneTop)
    }

    static func callback()
    {
    }
}
