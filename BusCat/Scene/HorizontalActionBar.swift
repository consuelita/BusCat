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
        HStack(spacing: 8)
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
                        .font(.system(size: 60))
                        .frame(width: 64, height: 64)
                        .hidden()
                    }
                    else
                    {
                        action.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .font(.system(size: 60))
                        .frame(width: 64, height: 64)
                        .foregroundColor(.white)
                    }
                }
                .buttonStyle(.plain)
                .border(.gray, width: 2)
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
        HorizontalActionBar(actions: ActionCollections.top)
    }

    static func callback()
    {
    }
}
