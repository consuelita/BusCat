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
                .resizable()
                .aspectRatio(contentMode: .fit)
                .font(.system(size: 30))
                .frame(width: 32, height: 32)
                .foregroundColor(.white)
            }
            .buttonStyle(.plain)

            HStack(spacing: 0)
            {
                ForEach($state.backpack.groups.wrappedValue)
                {
                    group in

                    VStack(spacing: 0)
                    {
                        ForEach(group.items)
                        {
                            item in

                            if let selected = $state.itemSelection.wrappedValue, item.id == selected
                            {
                                ItemView(item: item, selected: true, action: self.itemButtonPressed)
                            }
                            else
                            {
                                ItemView(item: item, selected: false, action: self.itemButtonPressed)
                            }
                        }
                    }
                }
            }
        }
    }

    func exit()
    {
        self.state.scene = state.backScene
        self.state.currentView = state.backView
    }

    func itemButtonPressed(_ item: Item)
    {
        if self.state.itemSelection == item.id
        {
            self.state.itemSelection = nil
        }
        else
        {
            self.state.itemSelection = item.id
        }
    }
}

struct BackpackView_Previews: PreviewProvider
{
    static var previews: some View
    {
        BackpackView()
    }
}
