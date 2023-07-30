//
//  BackpackView.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/30/23.
//

import SwiftUI

struct BackpackView: View
{
    @EnvironmentObject var state: GameState

    var body: some View
    {
        VStack
        {
            Button(action: self.exit)
            {
                Image(systemName: "x.circle")
                .font(.system(size: 60))
            }
            .buttonStyle(.plain)
            .colorInvert()

            HStack(spacing: 0)
            {
                ForEach($state.backpack.groups.wrappedValue)
                {
                    group in

                    VStack
                    {
                        ForEach(group.items)
                        {
                            item in

                            ItemView(item: item, action: self.itemButtonPressed)
                        }
                    }
                }
            }
        }
    }

    func exit()
    {
        self.state.currentView = .scene
    }

    func itemButtonPressed(_ item: Item)
    {

    }
}

struct BackpackView_Previews: PreviewProvider
{
    static var previews: some View
    {
        BackpackView()
    }
}