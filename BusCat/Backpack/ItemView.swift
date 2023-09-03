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
    @State var selected: Bool
    let action: (Item) -> Void

    public var borderColor: Color
    {
        if selected
        {
            return .white
        }
        else
        {
            return .gray
        }
    }

    var body: some View
    {
        Button(action: { self.action(item) })
        {
            if item.hidden || item.count == 0
            {
                item.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .font(.system(size: 32))
                .frame(width: 32, height: 32)
                .hidden()
            }
            else if item.count == 1
            {
                item.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .font(.system(size: 30))
                .frame(width: 32, height: 32)
                .foregroundColor(.white)
            }
            else
            {
                ZStack
                {
                    item.image
                    .font(.system(size: 30))
                    .colorInvert()

                    Text("\(item.count)")
                }
            }
        }
        .buttonStyle(.plain)
        .border(self.borderColor, width: 1)
    }
}

struct ItemView_Previews: PreviewProvider
{
    static var previews: some View
    {
        let item = Item.fish

        ItemView(item: item, selected: false, action: Self.itemPressed)
    }

    static func itemPressed(_ item: Item)
    {
        print("item pressed")
    }
}
