//
//  ItemView.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/30/23.
//

import SwiftUI

struct ItemView: View
{
    let item: Item
    let action: (Item) -> Void

    var body: some View
    {
        Button(action: { self.action(item) })
        {
            if item.hidden || item.count == 0
            {
                item.image
                .font(.system(size: 60))
                .hidden()
            }
            else if item.count == 1
            {
                item.image
                .font(.system(size: 60))
                .colorInvert()
            }
            else
            {
                ZStack
                {
                    item.image
                    .font(.system(size: 60))
                    .colorInvert()

                    Text("\(item.count)")
                }
            }
        }
        .buttonStyle(.plain)
        .border(.gray, width: 2)
    }
}

struct ItemView_Previews: PreviewProvider
{
    static var previews: some View
    {
        let item = Item.fish

        ItemView(item: item, action: Self.itemPressed)
    }

    static func itemPressed(_ item: Item)
    {
        print("item pressed")
    }
}
