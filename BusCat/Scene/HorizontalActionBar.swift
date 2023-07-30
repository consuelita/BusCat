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
    @EnvironmentObject var navigation: GameNavigation

    var body: some View
    {
        HStack
        {
            ForEach($actions.actions.wrappedValue)
            {
                action in

                Button(action: { self.actionButtonPressed(action) })
                {
                    if action.hidden
                    {
                        action.image
                        .font(.system(size: 60))
                        .hidden()
                    }
                    else
                    {
                        action.image
                        .font(.system(size: 60))
                    }
                }
                .buttonStyle(.plain)
                .border(.gray, width: 2)
            }
        }
        .colorInvert()
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
        HorizontalActionBar(actions: ActionCollections.top)
    }

    static func callback()
    {
    }
}
