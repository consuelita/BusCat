//
//  StackView.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 8/31/23.
//

import SwiftUI

struct StackView: View
{
    @State var stack: Stack

    var body: some View
    {
        if let card = stack.cards.first
        {

            let image: Image = card.getImage()

            image
            .resizable()
            .scaledToFill()
            .frame(width: card.size.width, height: card.size.height, alignment: .center)
            .clipped()
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .stroke(.foreground, lineWidth: 4)
            )
        }
        else
        {
            Rectangle()
            .fill(.tint)
            .border(.foreground, width: 2)
            .frame(width: $stack.wrappedValue.defaultSize.width, height: $stack.wrappedValue.defaultSize.height)
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .stroke(.foreground, lineWidth: 4)
            )
        }
    }
}
