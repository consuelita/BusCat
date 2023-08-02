//
//  VerticalInventoryBar.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/30/23.
//

import SwiftUI

struct VerticalInventoryBar: View
{
    @EnvironmentObject var state: GameState

    var body: some View
    {
        VStack(spacing: 8)
        {
            HStack
            {
                if $state.itemGroup.wrappedValue == 0
                {
                    Button(action: self.left)
                    {
                        Image(systemName: "arrow.left")
                    }
                    .buttonStyle(.plain)
                    .hidden()
                }
                else
                {
                    Button(action: self.left)
                    {
                        Image(systemName: "arrow.left")
                    }
                    .buttonStyle(.plain)
                }

                Text("\($state.itemGroup.wrappedValue + 1)")

                if $state.itemGroup.wrappedValue == 7
                {
                    Button(action: self.right)
                    {
                        Image(systemName: "arrow.right")
                    }
                    .buttonStyle(.plain)
                    .hidden()
                }
                else
                {
                    Button(action: self.right)
                    {
                        Image(systemName: "arrow.right")
                    }
                    .buttonStyle(.plain)
                }
            }
            .font(.system(size: 18))
            .padding(.bottom, 10)

            ForEach($state.backpack.groups[$state.itemGroup.wrappedValue].items.wrappedValue)
            {
                item in
                
                ItemView(item: item, selected: false, action: self.itemButtonPressed)
            }
        }
    }

    func left()
    {
        if state.itemGroup > 0
        {
            state.itemGroup = state.itemGroup - 1
        }
    }

    func right()
    {
        if state.itemGroup < 7
        {
            state.itemGroup = state.itemGroup + 1
        }
    }

    func itemButtonPressed(_ item: Item)
    {
    }
}

struct VerticalInventoryBar_Previews: PreviewProvider
{
    static var previews: some View
    {
        VerticalInventoryBar()
    }
}
