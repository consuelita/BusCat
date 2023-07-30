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
        VStack
        {
            ForEach($state.backpack.groups[0].items.wrappedValue)
            {
                item in
                
                ItemView(item: item, action: self.itemButtonPressed)
            }
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
